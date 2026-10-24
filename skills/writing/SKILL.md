---
name: writing
description: Writing guidance for academic purposes.
disable-model-invocation: true
---

Write in plain, explanatory academic prose, using the collective 'we' and speaking about 'the project', direct and moderately formal, using familiar technical language. Mix short statements with connected sentences that explain practical conditions and consequences. Keep paragraphs focused, use British English, and preserve citations and uncertainty. Avoid bureaucratic phrasing, repeated 'we will' or 'the project will' sentences, exaggerated claims, and unnecessary detail.

When supplied a source or told to find one always use the APA 7 reference format.

When in a writing session always provide the entire section you are working on even if you have only be told to change a small thing, so I can see the whole text. Unless told otherwise.

Easy checks:
- If you can reomve a sentence from a paragrpah and it sill makes sense, then that sentence had no real contribution and can be removed.

Below is guideance on how to structure and write the text in different sections of an academic report:

## Introduction

The overall structure of the introducion should be:
1. Context - How did you identify the problem and who is affected by it?
2. Problem - What problem is your project solving?
3. Contribution - What is the contribution made by your project towards solving the problem?

General tips:
- Statements should refer to facts that can be corroborated
- All facts must be referenced 
- The problem is revealed gradually by building on a set of facts
- Your motivation needs to be convincing
- Facts must be meaningful
- Use factual references to motivate your approach - your own experience is not enough
- Avoid blanket expressions that convey little meaning
  - “There are few applications” - which are those?
- ‘Text still standing’ test - remove a sentence, reread, does the paragraph still make sense?
- Don’t make assumptions without evidence
  - “Many people can find this to get stale” - how do you know?

## Literature Review

The literature review needs to be discussed based on a method

1. Discuss each step of the method
2. Search query used
3. Exclusion/inclusion criteria
4. Results and new search query definition  
 
Good example:

```
Primary search terms were grouped by topic area and combined using Boolean operators. Representative queries included: “gamification AND (physical activity OR exercise) AND (motivation OR adherence OR engagement)”, “GPS accuracy AND (consumer OR smartphone) AND (urban OR canyon OR multipath)” [...] 

Results were filtered to English-language publications from 2010 onwards, with explicit exceptions made for foundational works that predate the window (for example, seminal work on R-tree spatial indexing and on Self-Determination Theory).

The search followed a four-stage screening protocol[...]. 

The initial search returned several hundred results across the five databases. After deduplication, title screening, abstract review, and full-text assessment against the inclusion and exclusion criteria (see Table 2.1 “Inclusion and exclusion criteria applied at the full-text stage”,p.36), the final pool comprised the peer-reviewed and practitioner sources cited in this chapter.”

```

## Methodology

Describe the process/methodology AND the reasons you chose it

Discuss all alternatives considered - this is gold - it is a great way to justify decisions made

Always reference your project and the context of your project, i.e. available resources you have access to, results you obtained, review you have done, etc.

Don't just define these processes, the supervisor / moderator is always going to know the definition - we are intersted in a criticial review of the process.

Good example:

```
“When considering the methodologies for this project, there were some considerations to make in terms of how the project was set up. This project consisted of one developer. Also, there was a chance that requirements could change during the project due to feedback from peers or testing. 

Possible candidates included many of the agile methodologies but ultimately were not considered due to their reliance on other developers working on the application. For example, the Scrum method requires many developers to take on different roles, which is not possible. Also, Extreme Programming usually requires a pair of programmers when coding. Whilst this would speed up coding as another developer can suggest solutions and spot errors in code, this is not possible for this project. “
```

## Research Questions

Clearly state your research question(s)

Always explain:
1. Its source
2. Its element of novelty
3. Your aimed contribution to answering it
4. Its relevance in the context of the literature review

We are always going back to what has already been done. 

Good example:

```
“Can keystrokes be accurately classified in real-time?

As stressed in the conclusion of the literature review, most acoustic keylogging research focuses on offline post hoc analysis, where a full recording is available, rather than classifying keys as someone is typing. Therefore, the first research question aims to understand the feasibility of accurately classifying keystrokes in a live environment
where audio is received incrementally, and predictions must be made with minimal latency. This question is important because assessing real-time performance expands the current understanding of what is technically achievable by acoustic keyloggers, meaning defensive strategies can be designed accordingly in response to these findings.”
```

## Requirements

Be consistent when discussing methodology - interviews vs questionnaires

Details matter 
- “Some potential users” - does not say much - we want to know who specifcally are the users and how we know this, referencing back to earlier in the report and to primary research done (interviews, questionaires, etc)

Identifying the method used is not sufficient
- What do the interviews cover? How did you design them?

Don’t make assumptions about requirements
- Biases in questions: “Do you think this is a good idea?”
- There is no such thing as assumed requirements - they must always be gathered and specified

When specifying requirements, use a template and be consistent - it makes reading reports easier

Details make the difference between requirements and notes

User stories 

## Artefact/Prototype Design

- Justify your choice of architecture with references to your non-functional requirements
- Define the elements of your architecture
- Discuss all alternatives considered and rejected 
- The WHY is always the most important thing here

Good example:

```
“The separation between frontend and backend was a deliberate early decision. Keeping the frontend as a fully client-side SPA allowed it to be hosted as static files independently of the backend server, so frontend changes did not require a backend redeployment and the two tiers could be developed and tested in isolation. The alternative of a full-stack framework such as Next.js with server-side rendering (SSR) was considered but rejected.”
```
 
Summarise the essential, represent details in more readable formats

Briefly explain and reference all figures, tables, etc.


## Artefact/Prototype Implementation

Level of detail required to describe the implementation phase:

```
As an Android application had to be developed and the author had little experience in using Android Studio already. Android Studio 2.3.3 (the official IDE for Android) has been the more preferably choice as the programming environment over Java Eclipse. As programming language two alternatives had been detected, the over 20 years old programming language Java or the new, not even 1.5 years old programming language Kotlin. As Kotlin seemed to be a very modern, generally easier usable language, the author chose Java as the desired programming language as implementation guides and solutions to problems, which have been tackled in the past by others, haven’t been provide able in Kotlin.”
```

## Experimental Design

Describe the process of creating/training your dataset at a high level of detail
- Identify all steps followed
- Provide detailed descriptions of each step
- Discuss alternatives for each step
- Discuss limitation for each step and the process overall 

Good example:

```
“Creating the training dataset involved recording each key being pressed 50 times with varying speed and pressure with the aim of improving model generalisability. Each recording is saved using a filename corresponding to the key being pressed, thereby providing an implicit label for supervised learning. 50 samples provide sufficient training data, as prior research has shown as few as 25 samples can lead to reliable performance (Harrison et al. 2023). This dataset size also provides the flexibility to explore a wider range of training set sizes to assess the effects of limited training data (RQ3). In total, 37 different recordings were collected, forming the training dataset for the classification model.”
```

## Prototype Evaulation

Discuss the limitations of your approach during each development phase

Provide a justification for adjusting/changing a well defined method to better match your process; always have a plan B

Be honest about what the method you put in place covers, the results obtained or any biases that influence those results

Keep the design of any study (interviews, design workshops, usability evaluation) in the main report

Include any additional material collected as annex
- Sketches, survey answers, transcripts, etc.

Quantitative results need to be put in context
- Is “158.1811368 milliseconds per Gem” a long time? What does it compare to? What does that mean for a project that uses 100+ gems, 1000+ gems, etc?

Avoid superlatives 
- “More astonishing” does add any information

Justify partial evaluations

## Project Management

Discussing elements of project management, with a particular focus on delays 

- Discuss against the Gnatt chart in the PID
