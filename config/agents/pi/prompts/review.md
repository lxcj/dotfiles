---
description: Review uncommitted and staged git changes for bugs, security, and quality
argument-hint: "[commit range]"
---
Review the current git changes.

1. Run `git status --short` and `git diff` (`git diff --cached` for staged).
2. Analyze for bugs, security issues, error-handling gaps, and intent mismatches.
3. List findings with `file:line` and a concrete fix each.
4. If clean, say so.

$ARGUMENTS
