#### Using git through SSH (instead of HTTPS)
[Tutorial which I tested personally](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)

* It helps if you try to clone to a repo using https and get the following error. The reason could be an older version of git like 1.7.1 (which I had in VLSI43)

      error: The requested URL returned error: 403 Forbidden while accessing https://github.com/vineeshvs/tc2020.git/info/refs clone

* Once you have added the SSH keys to Github, change the origin of the repo in the local pc using the instructions below
    https://docs.github.com/en/github/using-git/changing-a-remotes-url
    * In short you can just use

      git remote set-url origin git@github.com:<GitHub_username>/<repo_name>.git

#### Organizing foldes in a Git repo

Consider the following model repos.

https://github.com/microsoft/terminal

https://github.com/apache/httpd

#### Rebase on pull to avoid merge-commits in the commit history

```console
git commit -a
git pull --rebase
git push origin master
```

[Ref](https://randyfay.com/content/simpler-rebasing-avoiding-unintentional-merge-commits)

#### Change the previous commit message

    git commit --amend -a

#### Using branches

    # List all current branches.
    git branch
    # Create a branch 
    git branch new_branch
    # Checkout to the new branch
    git checkout new_branch
    # Make necessary changes to files and do git add, git commit -a
    # Push the changes in the branch to the remote repo.
    git push origin new_branch
    # Come back to master branch
    git checkout master

    git branch -d <name_of_the_branch>

[Atlassian tutorial](https://www.atlassian.com/git/tutorials/using-branches)

#### Merging branches

```console
# Start a new feature
git checkout -b new-feature master
# Edit some files
git add <file>
git commit -m "Start a feature"
# Edit some files
git add <file>
git commit -m "Finish a feature"
# Merge in the new-feature branch
git checkout master
git merge new-feature
git branch -d new-feature
```

[Ref](https://www.atlassian.com/git/tutorials/using-branches/git-mergem a file to the previous remote commit version

```console
git checkout -- filename
```

[Ref](https://stackoverflow.com/questions/1817766/how-to-revert-to-origins-master-branchs-version-of-file)

#### Merging only selected files and folders from a branch to main branch

[Ref](https://stackoverflow.com/questions/10784523/how-do-i-merge-changes-to-a-single-file-rather-than-merging-commits/11593308#11593308)

Example
```console
# Commit everything in the branch 'test' which has a newly created folder doc/ inside an existing (in master) folder vineeshvs.
git checkout master
git checkout test vineeshvs/doc
```

#### Removing all committed files in directory with a particular name. 
Runs recursively in the current directory, it's sub-dictory and so on.

```console
find . -type d -name '\/<name_of_the_directory>\/' | xargs git rm -r --cached
# e.g. 
find . -type d -name '\/jgproject\/' | xargs git rm -r --cached
```

#### Creating .gitignore file

/data/ : Ignore the folder named 'data' in the current directory and all folders named '/data' in it's sub-directories.
data/ : Ignore all folders with name 'data' in the current dictory and it's sub-directories
[Ref](https://stackoverflow.com/questions/29820791/git-ignore-node-modules-folder-everywhere)

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
