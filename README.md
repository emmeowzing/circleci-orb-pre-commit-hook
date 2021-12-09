CircleCI Orb Pack and Validate pre-commit hook
----------------------------------------------

A [pre-commit](https://github.com/pre-commit/pre-commit) hook to run CircleCI Orb `pack` and `validate` steps on your commits.

### Prerequisites

You must have the `circleci` CLI installed, as well as specify the path to the orb source you would like to pack and validate as an argument. Defaults to `src/`, since `circleci orb init` will, by default, generate an unpacked repository structure for an orb's source under `src/`.

#### Example `.pre-commit-config.yaml`

```yaml
repos:
...
- repo: https://github.com/bjd2385/circleci-orb-pre-commit-hook
    rev: v1.0.0
    hooks:
      - id: circleci-orb-validate
        args:
          - src
```
