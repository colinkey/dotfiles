# Code Comments

Only use code comments when the surrounding code does not provide sufficient context to understand the code functions.

Good - provides context not clear from surrounding code:
```js
// We need to transform the input from the user into an object that our service will understand
// - All dates need to be validated and formatted according to ISO8601
// - Null data should be removed
function formatInputData(input) {
    // do something
}
```

Bad - restates the name of a single line function with clear functionality:
```js
// returns the first user from the response
function getFirstUserFromResponse(response) {
    return response.users[0];
}
```

# Command-line Tools

Prefer to use the following tools when working in the command line.
- `rg` (ripgrep) over `grep`
- `fd` over `find`
- `jq` when processing json and reading nested data
- `trash` (https://github.com/sindresorhus/trash-cli) over `rm`

# Testing

Follow test-driven development (TDD) whenever possible: write a focused failing test first, make the smallest change needed to pass it, then refactor. When TDD is impractical, explain why and add or update relevant tests before considering the work complete.

# Agent Knowledge Base

When instructions refer to the "Agent Knowledge Base", use the path in the `AGENTS_KNOWLEDGE_BASE_PATH` environment variable. This is the shared location for discovery findings and durable notes written for other agents and humans. For example, "do some discovery and write your findings to the agent knowledge base" means to investigate the task and record the findings there clearly.

# Git & GitHub

Anything that involves using git in a read mode is fine. Anything that affects git history must be controlled.

- **Allowed freely (read-only):** `git status`, `git diff`, `git log`, `git show`, `git branch` (listing), `git remote -v`, and similar non-mutating commands.
- **Requires approval:** any command that changes state but not history — switching branches (`git checkout`/`git switch`), stashing, creating/deleting branches, merging, rebasing, resetting. Ask before running.
- **Requires explicit instruction:** any command that syncs with remotes or writes to history — `git push`, `git pull`/`fetch`, `git commit` where the user has not asked for a commit, `git push --force`, amending, or tag creation. Never do these unprompted.
- **Branch naming:** `<github handle>/<story id if available>-<descriptive summary>`, e.g. `colinkey/abc-123-refactor-graphql-queries-with-search`.
- **Requires explicit instruction (GitHub):** any action via the `gh` CLI or an installed GitHub MCP — commenting, creating/editing/closing issues or PRs, reactions, reviews, releases. Read-only `gh`/MCP queries (viewing a PR, listing issues) are fine; anything that writes to GitHub is not.

# Communication Style

Prefer terseness over verbosity when communicating.
Prefer to admit that you're unable to come up with answer rather than attempting to fake it.
When getting offerred a correction, don't start with "You're absolutely right". It's implied.
If you are offerred a correction that is verifiably false, push back lightly before proceeded.
When summarizing research or referencing information found in documents, code, PRs, or other sources, provide URL citations using footnote style (e.g., [^1], [^2]) with a references section at the end.
