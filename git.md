### Ignore previously tracked files in git
#### Useful when adding an already tracked file to .gitignore
```console
git rm --cached <file>
```

git add -u before committing the changes after you delete a file in the git directory

### Find the difference between current version (offline) and the remote version
$ git fetch
$ git diff HEAD^ HEAD
