# Repository Guidelines

## Project Structure & Module Organization

This repository is a Gentoo overlay. Packages live at `category/package/`, for example `sys-process/pik/`. Each package directory contains versioned `*.ebuild` files and a generated `Manifest`; package-specific service files, launchers, and patches belong in `category/package/files/`. Repository metadata is under `metadata/`, while `profiles/categories` and `profiles/repo_name` register the overlay and its categories. There is no separate application source or asset tree.

## Build, Test, and Development Commands

- `pkgcheck scan` runs QA checks across the complete overlay.
- `cd category/package && pkgdev manifest` refreshes distfile checksums after adding or changing an ebuild.
- `ebuild category/package/package-version.ebuild clean unpack prepare compile test install` exercises the relevant package phases without merging it into the live system.
- `emerge --ask category/package` performs a final installation test when the overlay is enabled locally.

Run commands from the repository root unless the example explicitly changes directories.

## Coding Style & Naming Conventions

Follow Gentoo ebuild conventions and the existing EAPI 8 files. Use tabs inside phase functions and multiline dependency or crate lists. Keep metadata variables uppercase, phase functions lowercase (for example, `src_install`), and reuse `${PN}`, `${PV}`, and `${P}` instead of repeating package names or versions. Name ebuilds `package-version.ebuild`; keep helper filenames descriptive and package-local. Use brief comments only for non-obvious packaging decisions.

## Testing Guidelines

There is no centralized unit-test suite or coverage target. Run `pkgcheck scan`, exercise the phases affected by the change, and regenerate the package `Manifest`. Review the resulting diff to ensure unrelated versions and checksums were not changed. Packages with restricted or manual downloads may require distfiles in the configured cache before testing.

## Commit & Pull Request Guidelines

Use concise imperative subjects matching history: `Add dev-util/horse 0.1.0`, `Update sys-process/pik to 0.29.0`, or `Fix app-misc/reprompt 0.9.0`. Keep each commit focused on one package or repository concern. Pull requests should explain the packaging change, link relevant issues or releases, list validation commands and results, and include updated Manifests. Attach screenshots only for visible documentation changes.

## Security & Configuration

Never commit credentials, local Portage configuration, cached distfiles, or proprietary archives. Preserve upstream fetch restrictions and document manual-fetch requirements in the ebuild.
