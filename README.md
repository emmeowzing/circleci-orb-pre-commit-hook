CircleCI Orb Pack and Validate pre-commit hook
----------------------------------------------

A [pre-commit](https://github.com/pre-commit/pre-commit) hook to run CircleCI Orb `pack` and `validate` steps on your commits.

### Prerequisites

You must have the `circleci` CLI installed.

#### Example `.pre-commit-config.yaml`

```yaml
repos:
...
- repo: https://github.com/bjd2385/circleci-orb-pre-commit-hook
    rev: v1.3.1
    hooks:
      - id: circleci-orb-validate
```
