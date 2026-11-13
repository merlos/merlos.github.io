---
layout: post
lang: en
post_id: 2026-interoperability-is-not-integration
title: "Interoperability Is Not Integration"
keywords: "interoperability, integration, digital transformation, open standards, semantic interoperability, government technology, data standards"
description: "An API can make systems talk, but it cannot make them understand each other. Real interoperability also requires shared meanings, processes, responsibilities, and legal frameworks."
categories:
  - technology
  - government
---

People keep calling it interoperability when all they have built is integration.

An API returns JSON, two systems exchange data, and everyone declares victory. But if one system’s “name” means a full legal name and the other’s means only a given name, the systems are not interoperable. They are merely connected—and someone is still translating between them.

That distinction matters because citizens pay for incompatible systems. They fill in the same information repeatedly. Students wait while institutions verify certificates manually. A family’s birth notification gets stuck between a health system and a civil registry. Behind every “technical issue” there may be two organizations that have never agreed on what their data means, who is responsible for it, or whether they are allowed to share it.

## An API is not interoperability

Most government digital transformation strategies mention interoperability between systems and sectors. A health system may send a birth notification to a civil registry so that the registration process can begin. A civil registry may share information with an education ministry so officials know which children need to be enrolled in school.

These systems need to exchange information. But connecting them is only the beginning.

When you look closely at the implementation, the definition of “open standards” often seems to be: “We have an API, and it returns JSON.” JSON is a useful and widely adopted data-interchange format. That is good. But JSON tells us how a message is formatted; it does not tell us what the message means.

Consider this perfectly valid response:

```json
{
  "name": "John Smith"
}
```

What does `name` mean here?

* Is it the person’s given name, family name, or full legal name?
* Is it the name at birth or the person’s current name?
* Can it contain multiple family names or accented characters?
* Is it self-declared, or has an authority verified it?
* Which system is responsible for correcting it?

If the two systems do not agree on those questions, they do not share a meaning. They have an ad-hoc integration that happens to use JSON.

## Integration uses translators

The difference is easier to understand through language.

Imagine that your native language is German—Hallo!—and mine is Spanish. If we both speak English, English is our interoperability layer. We can exchange information without creating a custom translation for every conversation.

Integration is different. It is like the UN General Assembly: each speaker uses their own language, and translators convert every message for everyone else. A German speaker talks in German, a Spanish speaker receives the message in Spanish, and an intermediary does the work of translating between them.

That is what happens when systems have different data models, vocabularies, and assumptions. One adapter converts a birth date from one format to another. Another maps one institution’s definition of “address” to another’s. A third translates a certificate’s grading system. The systems are connected, but every connection needs its own translator.

This can work for a while. But as the number of systems grows, the number of mappings, exceptions, and maintenance tasks grows with it. Eventually, the translators become the architecture.

Interoperability is the alternative: systems share enough common rules and meaning that they can exchange and use information without bespoke translation for every pair of systems.

## The four layers of interoperability

The European Interoperability Framework is a useful way to think about the problem. Interoperability is not one thing; it has several layers.

### 1. Technical: can the systems communicate?

This is the layer most people mean when they say “interoperability.” It covers protocols, APIs, data formats, authentication, availability, and network connectivity.

Can one system send a message? Can the other receive it? Can they handle errors and confirm whether the message arrived?

Technical interoperability is necessary, but it is the easiest layer to demonstrate. A successful request proves that two systems can exchange bytes. It does not prove that they understand one another.

### 2. Semantic: do they mean the same thing?

Semantic interoperability is about shared meaning. It requires agreed definitions, data models, vocabularies, identifiers, and valid values.

If one system sends “address,” does that mean a postal address, a place of residence, or an address where a person can currently be found? If one system sends “degree,” does it mean any academic qualification, or only a university degree? If one system reports a death, what exactly is the date, status, and authority behind that report?

Without shared semantics, every recipient has to interpret the message—and interpretation is another word for translation.

### 3. Organizational: do the institutions know how to work together?

Even when systems can communicate and understand the data, the organizations operating them still need to agree on the process.

Suppose a health ministry reports a death to an interior ministry. Who sends the report? When must it be sent? Who checks it? Who processes it? Who monitors the exchange? What happens when a system is unavailable? Who investigates a failure, and who is accountable when the information is wrong?

These are not merely technical questions. They are questions about workflows, responsibilities, service levels, monitoring, and institutional cooperation.

### 4. Legal: are they allowed to exchange and use the information?

Finally, organizations need a legal basis for sharing information. They must comply with applicable privacy and data-protection rules, define who can access the data, and establish how it may be used, retained, and corrected.

A system can be technically capable of sharing information while the exchange is still unlawful or unauthorized. Connectivity does not create permission.

## The cost of translation

Consider academic certificates. Universities, schools, and high schools exist everywhere, but certificates are not necessarily represented using one universally adopted format, vocabulary, or verification process.

Imagine graduating from a university and applying for a job in another country. Your certificate may contain a degree title, institution name, grades, dates, and accreditation information. But if every institution represents those concepts differently, the employer cannot reliably verify it automatically.

Someone must inspect the document, interpret the vocabulary, contact the university, map the grading system, and decide whether the qualification is equivalent. The same work may be repeated by an immigration office, a ministry, or another university.

That is integration: one organization translating another organization’s meaning.

Interoperability would allow the certificate and its claims to be understood and verified through shared standards. It would not eliminate every difficult decision, but it would eliminate much of the unnecessary translation, manual checking, and ambiguity.

Multiply that problem across universities, countries, languages, and decades of records, and you can see why administrative processes remain expensive, slow, and fragile.

## Systems that truly work together

Interoperability is not an API, a JSON response, or a successful network connection. Those solve only part of the problem.

Real interoperability means that systems can communicate, understand the same information, follow an agreed process, and do so within a lawful framework. It means that government services do not force citizens to act as the translators between institutions.

Without that shared foundation, governments do not have interoperability. They have a growing collection of translators.