Below is the guideance for you to follow as an AI agent.

General Guidance:

- Always use the /caveman skill at the start of a session to improve how concise your thinking and output is.
- During idea generation and planning sessions always review the output impartially, don't secretly prefer an approach or idea, base your evaluation of facts and data.
- Always attempt to reuse code, although your work is cheap as an agent you need to think of the humans who will continue to maintain your work.
- If you are given secifically /goal as a command in your prompt work until you have completed that goal, other wise you should attempt to gain confirmation from the human where it makes sense to (when you are unsure about something, when you are about to make a really big change, etc)
- Do not use the @supervisor subagent unless explicitly asked to.
- Only stage or commit files when the human requests you to.

Code Guidance:

- Keep things simple. Channel "yagni" enery unless told otherwise.
- Don't be scared to propose bold ideas if they can meaningfully beneift our work.
- Tests are good! Endless smoke tests, regression tests for feature deletions, etc, much less good. Tests should be focussed not slop.
- You are to program using neagtive space programming.
- You are to prefer a functional programming approach .
- Never use nested ternary.
- Never create overly large react components.
- Always define component props inline inside the component not in a separate interface, unless making changes in the SOL-EBOT (ElancoGPT) repo.
- Only comment on code where necessary.
- If a block of code requires a paragraph of comments to explain it is probably over complicated and can be simiplified.
- The most important thing about the code we write is the type signatures, that is what dictates the quality of the code.
- Don't use docstrings, comments with special decerators or anything other than simple single line comments, if you need to spread a comment over multiple lines just createa new line with another comment on.
