# Contributing

Thank you for contributing to the XOps Maestros GitHub organization profile.

This repository is special-cased by GitHub: [`profile/README.md`](profile/README.md) renders as the
public profile page at [github.com/XOpsMaestrosHQ](https://github.com/XOpsMaestrosHQ), and this
repository's own [`README.md`](README.md) is what visitors see when they open the repository itself.
Branding and screenshot assets referenced by either live under [`public`](public).

## Contribution Standard

- Keep `profile/README.md` and `README.md` scoped to their own purpose - the org profile page is a
  public-facing pitch, not a docs index.
- Write all content in Markdown.
- Use clear, concise language and avoid unexplained acronyms.
- Optimize new images before committing them (banners/screenshots especially) and reference them
  with a relative path under `public/`.
- Never commit secrets, credentials, private keys, access tokens, `.env` files, or private internal
  values.

## Setup

Install dependencies with Bun:

```sh
bun install
```

Husky is installed through the `prepare` script:

```sh
bun run prepare
```

## Local Checks

Format all Markdown files:

```sh
bun run format
```

Check Markdown formatting:

```sh
bun run format:check
```

Run the forbidden-pattern scan:

```sh
bun run security:forbidden-patterns
```

## Commit Messages

This repository uses Conventional Commits:

```text
type(scope): short description
```

Examples:

```text
docs(profile): refresh the audience section
assets: add updated platform banner
chore(tooling): add markdown formatting checks
fix(readme): correct broken app link
```

Common types are:

- `docs`: profile or README content changes.
- `assets`: images, logos, or other branding assets.
- `chore`: tooling, repository maintenance, or non-user-facing updates.
- `fix`: corrections to inaccurate or broken content.
- `ci`: workflow and automation changes.
- `security`: security documentation, checks, or hardening references.

## Pull Requests

Before opening a pull request:

- Run `bun run format:check`.
- Run `bun run security:forbidden-patterns`.
- Confirm no secrets or internal-only values were added.
- Preview how any new/changed image renders on GitHub's profile page in both light and dark mode.

## Review Expectations

Reviewers should check for accuracy, tone, formatting, security exposure, and whether the change
reads well as the first impression of XOps Maestros on GitHub.
