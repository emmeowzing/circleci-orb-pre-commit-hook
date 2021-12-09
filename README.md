CircleCI Orb pre-commit hook
----------------------------

A [pre-commit](https://github.com/pre-commit/pre-commit) hook to run CircleCI Orb `pack` and `validate` steps on your commits.

### Prerequisites

You must have the `circleci` CLI installed, as well as specify the path to the orb source you would like to pack and validate as an argument.

#### Example `.pre-commit-config.yaml`

```yaml
repos:
...
- repo: https://github.com/bjd2385/circleci-orb-pre-commit-hook
    rev: v0.1.2
    hooks:
      - id: circleci-orb-validate
        args:
          - src
```