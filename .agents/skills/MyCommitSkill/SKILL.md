---
name: check-local-stack
description: Generates clear, conventional Git commit mess-lages based on staged changes. Use when the user asks to write a commit message or prepare a Git commit.
---

# Check local stack

## When to Use
- When the user asks for a commit message for their code changes.
- When reviewing `git diff` or `git status` before committing work.

## Instructions
1. Check the staged changes using `git diff --cached` (or review the code changes provided by the user).
2. Summarize the primary change using the **Conventional Commits** format: `<type>: <short description>`.
   - `feat`: A new feature or file
   - `fix`: A bug fix
   - `docs`: Documentation or `SKILL.md` updates
   - `chore`: Setup, config, or maintenance tasks
3. Keep the subject line under 50 characters, in the imperative mood (e.g., "Add", "Fix", "Update").
4. If multiple files changed, include 2–3 short bullet points below the subject line explaining why the changes were made.

## Example

**Input:** Added a new `SKILL.md` file inside `.agents/skills/git-commit-helper/`.

**Output:**
```text
docs: add git-commit-helper workspace skill

- Create SKILL.md with conventional commit guidelines
- Define formatting rules and examples for staged changes
```
