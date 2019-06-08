### Ignore previously tracked files in git

#### Applying .gitignore to commited files.

	git rm --cached <name_of_the_file>

[Ref](https://stackoverflow.com/questions/7527982/applying-gitignore-to-committed-files)

#### Useful when adding an already tracked file to .gitignore

	git rm --cached <file>

#### How to make the changes in the repo after deleting a file.

	git add -u #before committing the changes after you delete a file in the git directory

### Find the difference between current version (offline) and the remote version

	$ git fetch
	$ git diff HEAD^ HEAD

### Updating the local repo origin when the remote repository is moved to a new address (Eg: IP of the machine which hosted the repo changed)

* In the local repo use the following command,

	git remote set-url origin new.git.url/here

[Ref](https://stackoverflow.com/questions/2432764/how-to-change-the-uri-url-for-a-remote-git-repository)

Example 1:

	git remote set-url origin new.git.url/here

Example 2 (if it is a repo hosted in a local machine):

	git remote set-url origin username@10.107.111.111:~/repos/research.git
