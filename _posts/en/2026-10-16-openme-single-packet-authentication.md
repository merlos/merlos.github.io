---
layout: post
lang: en
post_id: 2026-openme-single-packet-authentication
title: "OpenMe: open your firewall with a single encrypted packet"
keywords: "openme, single packet authentication, SPA, firewall, SSH, port knocking, network security"
description: "OpenMe is a cross-platform Single Packet Authentication tool that keeps services invisible until an authorised client sends one encrypted UDP packet."
categories:
  - security
  - dev
image: '/assets/posts/2026-openme/openme-logo.png'
hero_image: '/assets/posts/2026-openme/openme-logo-400.png'
hero_alt: 'OpenMe logo'
---

Most internet-facing services begin with the same trade-off: expose a port so legitimate users can reach it, and accept that scanners, bots, and attackers can see it too. Secure Shell (SSH) is a common example. Even with key-only authentication, a public SSH port is continuously discovered, probed, and logged.

[OpenMe](https://openme.merlos.org) is my attempt at taking a different approach. It is a **[Single Packet Authentication](https://en.wikipedia.org/wiki/Single-packet_authorization) (SPA)** tool that keeps a firewall port closed until an authorised client asks to open it. The request is a single encrypted User Datagram Protocol (UDP) packet, or *knock*. If the server can verify it, it creates a temporary firewall rule for the client's Internet Protocol (IP) address. After 30 seconds, the rule disappears again.

To everyone else, the protected service stays closed.

OpenMe is currently a **beta project and a work in progress**. It is already useful for the setups I built it for, and I am very happy with how much it can do, but it has not had the maturity or broad real-world testing of established remote-access tools. Please treat it accordingly: keep the usual service authentication in place, test it carefully, and let me know if you find something that can be improved.

## What is in the name?

The name is a small homage to [Gomaespuminglish](https://youtu.be/QqU4wTCQLI4?si=4ezC0yEDV7FjxnSi&t=94), a wonderfully silly English-learning sketch by the Spanish comedy duo Gomaespuma. The line, “Candel OpenMe el MeOpen,” has stayed with me for years.

It also happens to fit the project rather well: OpenMe asks a server to open itself for you, briefly, only when you need it. It is a slightly ridiculous name for a security tool, which is exactly why I like it.

## The usual problem with remote access

Virtual private networks (VPNs) are an excellent option, but they can be more infrastructure than is needed to give a handful of people occasional access to SSH, an admin panel, or another internal service. Traditional [port knocking](https://en.wikipedia.org/wiki/Port_knocking) is lighter, but it commonly relies on a visible sequence of connection attempts. That sequence can be replayed, guessed, or detected.

I built OpenMe for the narrow but useful case where a service should be reachable only after an explicit, authenticated request:

* An SSH server at home or on a small virtual private server (VPS).
* A self-hosted administration interface.
* A development service that should not be publicly discoverable.
* A service exposed through Internet Protocol version 4 (IPv4), Internet Protocol version 6 (IPv6), or both.

It does not replace authentication on the protected service. SSH keys, Hypertext Transfer Protocol Secure (HTTPS) authentication, and good firewall rules still matter. Instead, OpenMe adds another layer by removing the public listening port from the first layer of exposure.

## One packet, not a conversation

The central idea is pleasantly simple: the client sends one 165-byte UDP datagram to the server. There is no Transmission Control Protocol (TCP) handshake, challenge-response exchange, or long-lived session to establish.

Before sending the packet, the client generates an ephemeral Curve25519 key pair. It uses [Elliptic-curve Diffie-Hellman (ECDH)](https://en.wikipedia.org/wiki/Elliptic-curve_Diffie%E2%80%93Hellman) to derive a shared secret with the server, encrypts the request with [ChaCha20-Poly1305](https://en.wikipedia.org/wiki/ChaCha20-Poly1305), and signs the full packet with the client's Ed25519 key. The server verifies the signature, decrypts the request, and validates both its timestamp and nonce before adding a short-lived firewall rule.

That design gives OpenMe a few properties I find particularly cool:

* **No visible open port:** scanners see the knock endpoint as a black hole and the protected port remains closed by default.
* **Replay resistance:** timestamps and nonces prevent a captured packet from being used again.
* **[Forward secrecy](https://en.wikipedia.org/wiki/Forward_secrecy):** each knock uses a fresh ephemeral key, so recording old traffic is not enough to decrypt it later if a server key is compromised.
* **Short exposure:** the allowed IP address is removed automatically after the configured window.

The protocol documentation explains the [packet format and security properties](https://openme.merlos.org/docs/protocol/) in more detail.

## From installation to SSH

I wanted the Linux server setup to stay small. Install the binary, initialise the server, add a client, and start the service:

```bash
sudo openme init --server myserver.example.com
sudo openme add alice
sudo openme serve
```

Adding a client prints a configuration block and can also provide a Quick Response (QR) code. Once the client has that configuration, a knock can open access and immediately run a follow-up command:

```bash
openme knock home
```

For example, that profile can send the knock and then run `ssh user@home.example.com`. The firewall rule is created only for the source IP that sent the valid knock, so other clients still cannot connect.

## Clients where they are needed

The server runs on Linux and supports both `iptables` and `nftables`. Clients are available for Linux, macOS, and Windows through the command line, with native graphical clients for macOS and Windows as well. There are also native iPhone Operating System (iOS), iPadOS, watchOS, and Android apps, making it practical to open access from the device already in your pocket.

I think that cross-platform support is important. A remote-access mechanism is only useful when it is convenient enough to use instead of permanently leaving a port open. Being able to knock from a laptop, desktop, or phone makes the idea much more practical.

## Try it

OpenMe is open source under the Massachusetts Institute of Technology (MIT) license. The source code is available on [GitHub](https://github.com/merlos/openme), and the [getting-started guide](https://openme.merlos.org/docs/getting-started/) covers server setup, client provisioning, and the first knock step by step.

If you run a service that only a known set of people should reach, I hope OpenMe is an interesting tool to try. It is still early, so feedback, bug reports, and contributions are very welcome. I have a lot more ideas to explore, but even at this stage, opening SSH from your phone with a single encrypted packet feels pretty cool.
