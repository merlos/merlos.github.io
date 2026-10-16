---
layout: post
lang: en
post_id: 2026-kvenv-keep-secrets-out-of-ai-agents
title: "kvenv: keeping secrets out of coding agents"
keywords: "kvenv, Azure Key Vault, secrets, environment variables, coding agents, AI security"
description: "I built kvenv after a coding-agent harness read my development credentials from a .env file. It replaces local secrets with Azure Key Vault references and injects them only when a command runs."
categories:
  - security
  - dev
  - ai
---

I have been having a lot of fun working with coding agents lately. Giving an agent a repository, a task, and enough tools to inspect, edit, and run the project is a remarkably productive way to build software. It is also a new security boundary that is easy to underestimate.

That is why I wrote [kvenv](https://github.com/merlos/kvenv), a small command-line tool that lets applications keep using environment variables without keeping their secret values in a local `.env` file.

The first release, `0.1.0`, is now available on [PyPI](https://pypi.org/project/kvenv/).

## The moment that made me stop

I was working with a coding-agent harness on a project. The harness could read the repository so that the agent could understand the code, run commands, and help with the task. That is exactly what makes these tools useful.

Then I noticed it had read my `.env` file.

In that case, the file contained development credentials, not production credentials. Nothing bad happened, and the credentials were not especially valuable. Still, that was beside the point. I had given an agent access to values that should not have been available to it at all.

The potential outcome was a data-exfiltration problem: an agent, a tool it invokes, a log, or a prompt could expose a secret outside the machine. Development credentials are often less privileged, but they are still credentials. They can reveal infrastructure names, grant access to non-production data, or become a stepping stone to something more important.

I did not want to solve this by refusing to use agents. I wanted the convenience of agents and the convenience of `.env`-based applications without leaving secrets lying around for every repository-reading tool to find.

## References, not values

`kvenv` keeps the familiar `.env` workflow, but replaces secret values with references to [Azure Key Vault](https://azure.microsoft.com/products/key-vault/).

Instead of this:

```dotenv
DATABASE_URL=postgresql://user:real-password@database.example.com/app
API_KEY=the-real-api-key
DEBUG=true
```

the file contains this:

```dotenv
DATABASE_URL=kv://my-development-vault/DATABASE-URL
API_KEY=kv://my-development-vault/API-KEY
DEBUG=true
```

An agent that reads the file sees variable names and Key Vault references, but not the database password or API key. That is a much more comfortable default.

At execution time, `kvenv` resolves only the `kv://` references, then starts the command with the resulting environment variables. Ordinary values such as `DEBUG=true` pass through unchanged.

```bash
kvenv -- python app.py
```

The application receives `DATABASE_URL` and `API_KEY` as usual. The `.env` file does not contain either secret.

## A tiny wrapper with an important boundary

The idea is deliberately simple. Before using `kvenv`, authenticate with the Azure CLI and make sure your identity has permission to read the relevant Key Vault secrets:

```bash
az login
pip install kvenv
```

Then add `kvenv --` before the command you normally run:

```bash
kvenv -- npm run dev
kvenv -- python manage.py runserver
kvenv -- docker compose up
```

You can configure a default vault without putting its name in every reference:

```bash
KEYVAULT=my-development-vault kvenv -- npm run dev
```

or pass it explicitly:

```bash
kvenv -v my-development-vault -- python app.py
```

The secrets exist in the environment of the command that needs them, not in a file sitting in the working tree. This is not a complete solution to every secret-management problem. A process that can read an environment variable can still leak it, so permissions, logging, and the commands we run still matter. But it removes an unnecessarily broad and persistent exposure: plaintext credentials in a file that editors, extensions, agent harnesses, and source-control mistakes can read.

## Better for people too

The agent-security angle was the spark, but this workflow has other benefits I like just as much.

* The `.env` file can be committed because it contains references rather than secret values.
* A team can share the same configuration without copying passwords through chat, email, or documentation.
* Secret rotation happens in Key Vault, and everyone receives the updated value the next time they run the application.
* Key Vault provides an audit trail for secret access.

`kvenv` was inspired by [1Password's `op run`](https://developer.1password.com/docs/cli/reference/commands/run/), which was a practical pattern, but at work I have to use Azure stuff.

# So...

Coding agents make it easier to build things quickly. They also make it more important to be intentional about what a repository contains and what a tool is allowed to read.

Seeing an agent harness open my `.env` file was a useful reminder that development secrets deserve the same care as production secrets. I built `kvenv` because I wanted a small, boring fix that works with the tools I already use.

If you use Azure Key Vault and want to keep your `.env` files safe to inspect, try it:

```bash
pip install kvenv
```

The source code, installation instructions, and usage examples are on [GitHub](https://github.com/merlos/kvenv). I am excited to see whether it makes agent-assisted development a little safer for other people too.
