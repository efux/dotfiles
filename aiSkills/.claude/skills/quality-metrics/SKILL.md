---
description: Runs deterministic, tool-based quality checks on the current changes and reports a pass/fail scorecard
---

Detect the project's language/stack from its config files (package.json, pyproject.toml, setup.py, go.mod, Cargo.toml, etc.) and pick the matching tools below.
Run the test suite and record the pass/fail count and total.
Run coverage and compare it against the base branch; flag if coverage dropped.
Run the linter and record the error count; it must be zero.
Run the type checker (tsc, mypy, etc.) if the project uses one and record the error count; it must be zero.
Run a full build/compile step and record success or failure.
Run a complexity tool (radon for Python, lizard for multi-language projects, or the eslint complexity rule for JS/TS) and flag any function above a cyclomatic complexity of 10.
Run a duplication tool (jscpd or equivalent) and record the percentage of duplicated lines.
Run a dependency vulnerability scan (npm audit, pip-audit, osv-scanner, or equivalent) and record the count by severity.
Run a secrets scan (gitleaks or equivalent) over the diff.
Compare the diff size in lines changed against the scope described in the originating issue, if one is referenced, and flag if it looks disproportionate.
If a benchmark suite exists, run it and compare against the last recorded baseline; flag regressions over 10%.
Skip any check whose required tool is not installed or not configured for this project, and say so explicitly rather than silently passing it.
Present all results as a single scorecard: metric, value, threshold, pass/fail. Do not add commentary or judgment calls about whether the implementation is good — this skill only reports numbers.
