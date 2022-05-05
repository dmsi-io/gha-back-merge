# gha-back-merge

The purpose of this GitHub Action is to automate the merging of main back into develop following a release.

## Inputs

| NAME                  | DESCRIPTION                                            | TYPE      | REQUIRED | DEFAULT                     |
| --------------------- | ------------------------------------------------------ | --------- | -------- | --------------------------- |
| `src-branch`          | What branch is acting as the source of the merger      | `string`  | `false`  | default branch              |
| `dest-branch`         | What branch is acting as the destination of the merger | `string`  | `false`  | `main`                      |
| `submodules`          | Whether to checkout submodules                         | `boolean` | `false`  | `false`                     |
| `token`               | GitHub token                                           | `string`  | `false`  |                             |
| `commit-message`      | The commit message to use for the merge                | `string`  | `false`  |                             |
| `commit-author-name`  | The author name to use for the merge                   | `string`  | `false`  | `github-actions`            |
| `commit-author-email` | The email to use for the merge                         | `string`  | `false`  | `github-actions@github.com` |

## Example

```yaml
name: Back-Merge

on:
  push:
    branches:
      - main

jobs:
  merge:
    name: Merge Main into Develop
    runs-on: ubuntu-latest
    steps:
      - name: Test App
        uses: dmsi-io/gha-back-merge@main
```
