# Contributor Instructions

## Scope

`browser-agent-cli` provides the `chrome-beta-agent` and `chrome-beta-agent-stop` launchers plus an agent skill. User installation and browser usage belong in `README.md`, `llms.txt`, and `skills/SKILL.md`.

## Compatibility

- Preserve command names and environment-variable contracts.
- Keep the dedicated Chrome Beta profile isolated from the user's normal browser profile.
- Never close an unowned browser/profile or weaken ownership/lease safety.
- Do not install or upgrade global packages as part of ordinary repository work.
- Shell changes must remain compatible with the supported macOS environment and paths containing spaces.

## Verification

- Run `bash -n` on changed shell scripts.
- Exercise launcher argument parsing and already-running recovery for launcher changes.
- Exercise graceful stop without touching unrelated Chrome profiles for stop/lifecycle changes.
- Keep README, `llms.txt`, and the skill synchronized when the public interface changes.

## External actions

Browser inspection is read-only by default. Ask before form submission, messaging, upload/delete, account changes, legal acceptance, billing, or security changes. Stop for CAPTCHA, MFA, passkeys, SMS, or email verification.
