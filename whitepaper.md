# Background

On 30 April 2016 a bold attempt was made to launch the world’s first Decentralized Autonomous Organization (DAO) on the Ethereum [@ethereum] blockchain. This was the first attempt at the creation of a new kind of token that would empower it’s holders to exert control on the asset they owned. Unfortunately, this first attempt blew up spectacularly after a security flaw was exploited and millions of dollars were drained from the DAO. This incident resulted in the Ethereum Classic (ETC) / Ethereum (ETH) hard fork - one of the first of its kind. Even though the DAO was a failure, it showed the world how powerful a crowd sale on the blockchain could be. The era of the Initial Coin Offering (ICO) - or token sale - had started.

Fast forward to today (Q1 2018) and there have been many hundreds of ICOs to date. Startups in 2017 raises \$5.6BN dollars using token sales. Despite a slowdown in the crypto markets in early Q1 2018, it is likely that the demand for ICOs will only increase. Right now most prominent ICOs are centered around some form of decentralization platform, but ICOs are increasingly seen as a means to raise funds for any kinds of startup or later stage company (reverse ICOs).

It is not unreasonable to assume the long tail of publicly traded tokens will include new kinds of assets such as real estate, vehicles, collectables or even living animals. As a result new ICOs have sprung up that attempt to create market places centered around a given asset type. Currently the crypto space is undergoing a Cambrian explosion of marketplaces. It’s questionable whether we really need that many derivative marketplaces. Are these new market places really contributing to an increase of overall asset liquidity? Or are they more like data silos impeding liquidity? Only time will tell.

An alternative narrative is that public blockchains - and in particular Ethereum - are perfectly suitable to incorporate any digital asset. The maturing contract standards - in particular ERC20 and ERC721 - are an example of how much easier it has become to deploy assets directly on the public blockchains. Also, on other upcoming blockchain platforms such as NEO there are promising new standards such as NEP5 and novel methods of allowing users to participate in these ICOs.

In order to facilitate the offering of new assets on public blockchains we need secure and reliable tools that make this easy. Doing a token sale has become much more complex than simply creating and ERC20 contract and letting people send ETH to the address. Security best practices need to be followed, expectations with potential investors need to be managed and fast changing regulatory requirements need to be met.

There are a variety of ICO platforms that attempt to make these token sales easier, but here again the proprietary model is taken and a new marketplace middleman is formed. It is Moonfish’s goal to provide open, secure, publicly audited and reliable open source software to facilitate token sales.

# The Moonfish Platform

Doing a token sale has become an increasing complex endeavor. Often the focus of tools is to
ease the creation and deployment of the smart contracts related to a token sale, but there is a
lack of mature tools around managing the token sale end-to-end.

The token sale process can be divided up in the following stages:

  - Initial marketing
  - Whitelist registration
  - Pre-sale
  - Active token sale
  - Post-sale communication

The Moonfish platform provides an end-to-end solution for all stages in the token sale process.

## Token Sale Flow

Each token sale has their own crowd sale dynamics coded into the smart contracts. For example, some token sales provide bonuses between certain time periods. Orthogonally, there have been a wide variety of different user flows in acquiring these tokens in the sale process. These user flows can be categorized as follows:

A) Uncontrolled: Disclose Smart Contract address, and allow anyone to participate by sending funds.

B) Uncontrolled, but Tracked: Solicit basic information (e.g. email, acceptance of terms, and ETH address) and subsequently reveal a Smart Contract address that can be used for participation.

C) Managed: Provide a full featured login experience to any applicant and then manage a wallet (private key and public key) for the user to participate.

D) Semi-managed: Provide a limited login experience to facilitate communication and KYC compliance, but use a public Smart Contract address to participate. 

Most of the early token sales were done using Flow A and B. There are numerous down sides to these approaches such as underlying Blockchain congestion, limited means of communication, KYC compliance risk and frustration on behalf of aspiring participants when limits are reached.

Flow C is used by a lot of popular ICOs. The benefit of managing wallets is that it makes it easier to allow for non-Ethereum contributions for ERC20 token offerings. However, a very large downside is that funds are managed centrally by the token sellers, which means that a single hack can result in a massive loss of funds.

Moonfish’s core token sale flow is based on Flow D - with added best practices to minimize security risks.

## Applicant Management

When it comes to decreasing security risks, there are two kinds of breaches that need to be protected against:

A. Loss of personal applicant data.
B. Spoofed official communication to applicants.

In order to minimize breach A - Moonfish will not store any user generated passwords. Instead
of providing applicants with an email/password login, we will only use second factor
authentication to obtain access. This is initially done by obtaining a temporary session token -
also known as a magic token - that is send via email. At a later stage, we can make this
process two factor by including secondary authentication mechanisms such as Google
Authenticator and SMS.


In order to minimize breach B - Moonfish will generate a unique mnemonic phrase for each
user that can be used to verify the authenticity of the communication. The Ocean Protocol’s
recent ICO used this clever mechanism to minimize the potential of spoofed communication
with the applicants.

In addition to this, Moonfish will integrate with third party email providers such as Postmark
that support additional identity and verification measures such as DKIM and SPF.

## Token Sale Portal & Administration System

The Moonfish token sale solution includes a default portal. This portal provides all promotional
information about the token sale as well as the current status and parameters of the token sale
process.

This portal will include best practice placeholder legal information such as Privacy Policy,
Terms of Token Sale and additional regulatory warnings.
To increase the security of the portal, anti-phishing warnings and confirmations can be added
as well as best practices for deployment behind an anti DDOS firewall such as Cloudflare.
The user interface for applicants, the portal and the administration system is a self contained
app that interfaces with a JSON API backend. This frontend application is implemented using
React, Redux and Semantic UI. The backend system is fully controllable through well tested
and documented JSON APIs.

## Whitelisting Mechanics

It’s become common practice for token sales to have a period of whitelist registration before
starting the active token sale period. During this period, applicants can register to the whitelist
and they will receive updates from the token sale administrators when participation in the token
sale is possible. Having a whitelist of applicants allows for a token sale process that’s more
organized and controlled.

There are numerous configurations possible here. Some may choose to limit the number of
applicants, and not allow any further registrations. Some may choose to allow oversubscribing
of the whitelist so that applicants could participate in a future funding round. Or some may
choose to also limit the number of whitelist applicants based on the amount of capital that’s
“soft-circled”. Moonfish will support a plethora of different configurations here.

## Open Software

The core Moonfish platform is completely free and open source. This allows us to strengthen
the platform by harnessing the expertise of the open source community. Also, all source code
is completely audit-able by anyone that chooses to use the Moonfish platform for their ICOs.

## Other Security Considerations

Moonfish will provide an open forum for the developer community to strengthen its security. In
addition to the aforementioned security and reliability decisions, we’ve added the following
requirements:

  - Full unit test coverage of all business logic and APIs.
  - Continuous integration of unit tests, listing and test coverage measurements.
  - Enforced ES linting on all JavaScript and Node.js code.
  - Administrative password hashed using BCRYPT password hashing best practice.
  - Automatic checks for mis configuration (default keys) for new deployments.
  - Client-server communication using JSON Web Tokens. Different private keys are used for admin accounts.
  - Both JWT and magic tokens expire within short time period (2 hours and 1 hour respectively).
  - All solicited input fields are validated and that validation is unit tested.

## Evolving Best Practices

The crypto and in particular the ICO space is a very nascent sector that’s still developing it’s
best practices. These practices span across many different disciplines such as IT, software,
marketing and legal.

It is the aim of Moonfish to provide a framework for discussion of these practices and to
actively codify these practices into working systems.

A good starting point for this is providing templates for peripheral matters such as:

  - Default ERC20 Smart Contracts. The approach here is to take what’s best out there - such as the excellent work being done by the Zeppelin foundation - and incorporate it.
  - Legal templates for different kinds of crowd sales.
  - Technical white paper template. The white paper you’re reading right now is an open source template freely available to anyone.
  - The Moonfish token sale website is itself available in source code. It’s the default portal that’s available in the Moonfish token sale application. In the future additional “themes” and skins can be made available.

# Moonfish Tokens

In the past year token offerings have become increasingly ambitious. There are countless of
large ICOs that have raised vast amounts of capital on a white paper and little working code. It
is likely that future token offerings for startups are going to look more like traditional funding
rounds, where early rounds are smaller and become larger as the project proofs out its ability to
execute.

In the spirit of this, we are planning a very small initial token sale for Moonfish. The goal of this
“Moonfish PoC Token Sale” is twofold: 1. Proof out that we can do a token sale with the
Moonfish software (ICO the ICO software if you will); 2. Get some modest funding in place to
support the development efforts of the project.

The core Moonfish platform is open source and will remain open source. This ho
The Moonfish PoC tokens will initially not have any tokenomics associated with them.
However, once we’ve proven the MVP (see Roadmap) the goal is to develop tokenomics in a
commercial extension of the platform. These Moonfish PoC tokens will convert into thissecondary offering. The exact details of the tokenomics and secondary offering mechanics are to be determined as the roadmap progresses.

# Roadmap

Phase 1: Proof of Concept Development

Phase 2: Moonfish PoC ICO

Phase 3: Proof of MVP

Phase 4: Tokenomics Development & ICO

Phase 5: Further Decentralization

\clearpage

# References

---
title: "Moonfish Whitepaper"
subtitle: "Aesculeae domus vincemur et Veneris adsuetus lapsum"

abstract: |
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus suscipit ante vel scelerisque consequat. Integer dapibus nulla cursus urna dignissim auctor. Proin sollicitudin et ipsum ut luctus. In id velit auctor, facilisis augue ac, rhoncus diam. Nam vitae dolor nisi. In hac habitasse platea dictumst. Praesent ornare nisi sit amet orci rutrum, sed tempor tortor condimentum. Nunc eu lacus imperdiet, imperdiet diam sed, tincidunt erat.

company:
- name: Moonfish LLC
  url: https://moonfish.one/
  telegram: telegram://moonfish
  twitter: https://twitter.com/moonfish
  reddit: https://reddit.com/r/moonfish

author:
- name: Dominiek Ter Heide
  affiliation: Moonfish
  email: dominiek@moonfish.one
  linkedin: https://linkedin.com/dom
  twitter: https://linkedin.com/dom
  github: https://github.com/dom


titlepage: true
titlepage-logo: include/moonfish-logo.pdf
titlepage-color: "050520"
titlepage-text-color: "e5eefa"
titlepage-rule-color: "fad500"
titlepage-rule-height: 2

tags: [Moonfish, ICO, Whitepaper]
date: 2018-03-20

bibliography: whitepaper

---
