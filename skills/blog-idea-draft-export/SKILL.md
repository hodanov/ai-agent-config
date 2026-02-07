---
name: blog-idea-draft-export
description: Create or update a Markdown blog draft from recent work and export it to `~/workspace/hodalog-hugo/docs/idea/` with `YYYY-MM-DD_slug.md` naming. Use when the user asks to turn completed implementation/review work into an article draft, memo, or publish-ready idea post for hodalog.
---

# Blog Idea Draft Export

## Goal

Create a clean Markdown draft from recent work context and save it under `~/workspace/hodalog-hugo/docs/idea/` with consistent naming and linted formatting.

## Workflow

1. Gather source context from the current conversation first.
2. Supplement context only when needed (for example: changed files, PR title/body, key commands, or outcomes).
3. Choose a short kebab-case slug.
4. Use local date (`date +%F`) and build the filename as `YYYY-MM-DD_slug.md`.
5. Ensure `~/workspace/hodalog-hugo/docs/idea/` exists.
6. If the target file already exists, ask before overwriting.
7. Write the draft in Markdown.
8. Run `markdownlint-cli2 --fix <target_file>`.
9. Return the output file path and a short summary of the draft structure.

## Draft Structure

Use this as the default skeleton, then adapt to the user request.

```markdown
# <Article title>

## TL;DR

<1-3 lines>

## Background

<Why this work was needed>

## What I Changed

- <Change 1>
- <Change 2>
- <Change 3>

## Key Implementation Notes

- <Design choice or tradeoff>
- <Operational detail>

## Pitfalls and Fixes

- <Issue>
- <How it was resolved>

## Result

<What improved, what became easier>

## Next

<Optional follow-up>
```

## Writing Rules

- Match the language and tone requested by the user.
- Keep technical details concrete (file paths, commands, settings).
- Prefer practical lessons over long background theory.
- Avoid adding claims that are not present in the source context.
