# gha-back-merge

The purpose of this GitHub Action is to automate the merging of main back into develop following a release.

### Usage

```yaml
name: Test-Lint

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

### Optional inputs

#### Source Branch

The branch to merge from.

Default: 'main'

```yaml
  with:
    src-branch: 'production'
```

#### Destination Branch

The branch to merge into.

Default: 'develop'

```yaml
  with:
    dest-branch: 'development'
```

#### Commit Message

The commit message to use when merging.

Default: "Merged <src-branch> into <dest-branch>"

```yaml
  with:
    commit-message: 'Back merge'
```

#### Commit Author

The author to use when committing the merge.

Default:
 * Name: 'github-actions'
 * Email: 'github-actions@github.com'
