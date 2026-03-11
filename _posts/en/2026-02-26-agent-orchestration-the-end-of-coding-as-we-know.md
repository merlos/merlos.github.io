---
layout: post
lang: en
post_id: 2026-agent-orchestration
title: "Agent orchestration. The end of coding as we know"
keywords: ai, agentic orchestration, vibe coding, coding with agents
description: "Is software development doomed because of AI or is it
the best time to be a software developer? My thoughts about coding
agents.
"
categories:
  - ai
  - ai-agents

  


---

Are we doomed or it's the best time to be a software developer? 

These days, if you don't mention AI in your writing, you risk appearing obsolete. Software engineering is currently undergoing a profound paradigm shift—one that may see traditional engineering disappear in favor of what can be called **Code Agent Orchestration**.

## The Rise of the AI Agent

You have likely heard of [OpenClaw](https://openclaw.ai), an open-source personal assistant that has gained massive traction on GitHub. Its creator was recently hired by OpenAI. 

While the product itself is interesting, its tagline is what truly resonates: *"An agent that actually does things."* What I find most enlightening is how it was developed. In a recent interview on the [Max Friedman podcast, Peter Steinberger](https://lexfridman.com/peter-steinberger), the creator of OpenClaw explained his development process.

Essentially, to evolve the product, he engages in a conversation with a coding AI (using tools like Claude Code or CodeX). Indeed he does this with several in parallel. And these agents are the ones actually writing the code in the repository.

## From Code Snippets to Repo Access

Steinberger explains in the podcast how he leveraged AI agents to generate the code. And the key change is the **agentic nature** of the LLM—the ability of the AI to work directly on the codebase. 

In the "early days" (only a year or two ago!), the workflow was incredibly high-friction. To get anything done with ChatGPT, you had to follow a manual loop:

1. **Prompt**: Provide a detailed spec in a chat window.
2. **Wait**: Watch the code chunk generate line-by-line.
3. **Manual Labor**: Copy-paste the code into your IDE.
4. **Debug**: Copy-paste the error back to the chat if it failed and repeat.

This process was clunky and fragmented.
 
Now, the code agent removes the "middle-human" for these repetitive tasks, allowing the AI to work directly on the codebase. It can:
1. Read the existing architecture.
2. Modify source files directly.
3. Write and run tests to verify the changes.
4. Fix runtime problems before finishing the task.

This is further enabled by increased **context windows**. Where early models could only "remember" a few hundred lines of code, modern models can hold entire relatively large codebases in memory, allowing the agent to understand complex dependencies across a large project.

Because it can take some time for an agent to complete a task, to be more productive, Steinberger was launching several agents in parallel. For instance, while one was completing a complex refactor, he was discussing the architectural approach of a new feature with another. Indeed, he achieved such level of proficiency that he confessed he had to purchase several accounts because he run out of credits. 

Peter Steinberger also confesses that he no longer reviews every line of code; he focuses only on critical components. His rationale is that most code is "boring"—simply moving data from one place to another or transforming between formats. Newer models are now proficient enough to handle these tasks autonomously.

## The Death of Language Barriers

Another interesting shift is that you no longer need to be "proficient" in a specific language to build with it. Most programming languages share common concepts: variables, loops, and conditions. While the syntax varies—semicolons here, indentation there—the logic remains similar.

Historically, the real barrier was learning the **libraries and ecosystems**. This is what separated a senior developer from a newbie. However, LLMs have "read" all the documentation. This enables a frontend developer who knows JavaScript to suddenly write a Python backend, a native iOS app in Swift, or even C++ for an IoT microcontroller. 

Language is no longer the barrier, but your skill to instruct the agent to write what you need.

## The Future: Creative Destruction

We are at the "steam engine" moment of software development. This is a period of **creative destruction**. How may this affect our industry?

### At the Individual Level
A developer might see the glass as half-empty: years of skill-building are being devalued as LLMs do the job faster and cheaper. However, the glass is also half-full: these tools provide superpowers. You can now build ideas in weeks that previously required a full team and months of effort.

### At the Market Level: 

TheseWe can expect software development costs to **plummet**. Here is how I believe this shift will affect the industry:

*   **Layoffs and Salaries:** We can expect a market correction. As a single developer becomes as productive as five, the demand for traditional "junior" roles may decrease. Additionally, the barriers to entry will lower; as more people enter the market, we may see a downward trend in average salaries.

*   **SaaS Competition:** Established enterprise software giants will face a "mushrooming" of new competitors who can offer the same core features at a fraction of the price. In an even more saturated market, strategies to make your product shine among the others.

*   **Commoditization of Development:** Small to medium companies that previously relied on off-the-shelf SaaS or complex enterprise systems may now choose to build custom, in-house tools. While custom software can be perfectly integrated into a company's specific processes, enterprise software often requires the company to adapt to the tool—cluttering the experience with unnecessary features and a steeper learning curve.

## A Paradox of Creativity

There is a strange paradox in this revolution. We once imagined technology would automate "blue-collar" labor—cleaning floors or filing invoices—to free humans for the "white-collar" joy of writing, drawing, and coding.

Instead, we are seeing a world where generative AI targets the tasks we find most intellectually rewarding, while humans are still required for the physical labor.

I love coding. Even after 20 years, I still find it magical to see logic come to life on a screen.  However, I’ve been playing with this "mini-army" of agentic minions lately, and it is transformative. 

While agentic workflows might commoditize the syntax, they amplify the vision. We aren't losing the craft; we are evolving into **Code Agent Orchestrators**. The ceiling for what a single developer can build has just been shattered. What a time to be alive. 

Are you ready to lead the orchestra?
