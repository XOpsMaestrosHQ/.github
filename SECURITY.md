# Security Policy

This repository holds the XOps Maestros GitHub organization profile, community health files, and
public branding assets. Treat all contributions as security-sensitive - it is a public repository.

## Do Not Commit

- Secrets, passwords, private keys, tokens, certificates, or copied `.env` values.
- Internal-only hostnames, IP addresses, account IDs, access paths, or private URLs.
- Screenshots that expose credentials, private URLs, tokens, or internal project data.
- Any file that isn't genuinely public-facing organization profile content or tooling.

## Reporting A Security Issue

Do not open a public issue for sensitive security findings.

Report the issue through the approved internal team channel and include:

- A short description of the exposure or risk.
- The affected file, workflow, or asset.
- Whether the value is still active.
- Any immediate mitigation already taken.

## Local Security Checks

Run the local repository scan before pushing:

```sh
bun run security:forbidden-patterns
```

CI also runs secret and vulnerability scans on pull requests.
