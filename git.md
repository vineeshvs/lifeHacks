### Ignore previously tracked files in git
#### Useful when adding an already tracked file to .gitignore
```console
git rm --cached <file>
```

git add -u before committing the changes after you delete a file in the git directory

### Find the difference between current version (offline) and the remote version
$ git fetch
$ git diff HEAD^ HEAD

### Updating the local repo origin when the remote repository is moved to a new address (Eg: IP of the machine which hosted the repo changed)

In the local repo use the following command,
  ```bash
  git remote set-url origin new.git.url/here
  ```
  [Ref](https://stackoverflow.com/questions/2432764/how-to-change-the-uri-url-for-a-remote-git-repository)

  Example 1:
  ```bash
  git remote set-url origin new.git.url/here
  ```
  Example 2 (if it is a repo hosted in a local machine):
  ```bash
  git remote set-url origin username@10.107.111.111:~/repos/research.git
  ```


