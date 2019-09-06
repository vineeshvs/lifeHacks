#### Add the contents of an existing local folder to an empty fresh repository.

* Switch to your local directory.

```console
cd /path/to/your/repo
```

* Connect your existing repository to your fresh remote repo.

```
git remote add origin https://yourusername@bitbucket.org/username/reponame.git
git push -u origin master
```


#### How to avoid pushing large files into the repo.
Bitbucket will make the repo 'read-only' if it exceeds 2GB. Ideally your repo should be less than 1MB.

Quoting Bitbucket team: "Ideally, you should keep your repository size to between 100MB and 300MB. To give you some examples: Git itself is 222MB, Mercurial itself is 64MB, and Apache is 225MB. You can check out these open source repositories here: https://bitbucket.org/mirror/". [Ref](https://confluence.atlassian.com/bitbucket/reduce-repository-size-321848262.html#Reducerepositorysize-Bitbucketrepositorymaintenance)

* Sort the files in a directory (and sub directories) in descending order of file size.
  * Go to the root of the repo and run the command in terminal.
	```console 
	find . -type f  -exec du -h {} + | sort -r -h > list_of_files_in_order_of_size.txt
	```
      
* Open the file list_of_files_in_order_of_size.txt and find out the file extensions of the large files (say the top 20 files). 
  Note: Be careful about the folder .git. Don't consider those files. Eg: Don't add *.pack (a file extension in the .git folder in the root of the repo) in the .gitignore. I don't know what would happen if we do.
* Add those extensions to the .gitignore file placed at the root directory of this repository. Post those extensions in this thread so that everyone can update their .gitignore file.
* Since .gitignore file ignores only new files, we need to do the following (for every extension) also to remove already committed files in git. Given below is the example for .lst files.
  Eg: Removing .lst files from git.
  ```console 
  git ls-files | grep '\.lst$' | xargs git rm --cached
  ```

#### Ignore previously tracked files in git

```console
git rm <name_of_the_file_with_path> --cached
```

_--cached_ is used to removed previously tracked files from Git.

#### See the changes in a particular commit
	
```console
	git show 24c3ccca81fa5242496d47be763369a822560890
```
	
[Ref](https://stackoverflow.com/questions/17563726/how-to-see-the-changes-in-a-git-commit)

Note: The changes in that commit will open in Vim. Search for the name of your folder to see if your friend has changed your folder during that commit.

#### Removing already commited files from a git repo.

* Delete the file from git (not from the local drive).

```console
	git rm --cached <file>
```
	# Remove all files with the extension 'lst'. It will remove the files from the repository, without removing it from the local disk.
```console
	git ls-files | grep '\.lst$' | xargs git rm --cached
```

[Ref](https://stackoverflow.com/questions/7527982/applying-gitignore-to-committed-files)

* Add the extension to the .gitignore file.

#### How to make the changes in the repo after deleting a file.

```console
	git add -u #before committing the changes after you delete a file in the git directory
```

### Find the difference between current version (offline) and the remote version

```console
	$ git fetch
	$ git diff HEAD^ HEAD
```

### Updating the local repo origin when the remote repository is moved to a new address (Eg: IP of the machine which hosted the repo changed)

* In the local repo use the following command,

```console
	git remote set-url origin new.git.url/here
```

[Ref](https://stackoverflow.com/questions/2432764/how-to-change-the-uri-url-for-a-remote-git-repository)

Example 1:

```console
	git remote set-url origin new.git.url/here
```

Example 2 (if it is a repo hosted in a local machine):

```console
	git remote set-url origin username@10.107.111.111:~/repos/research.git
```
