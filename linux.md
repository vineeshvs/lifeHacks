
### Installing gcc-7 in Ubuntu 16.04

* Method 1

[Ref](https://gist.github.com/jlblancoc/99521194aba975286c80f93e47966dc5)


* Method 2 (Not recommended)
```console
sudo add-apt-repository ppa:jonathonf/gcc-7.3
sudo apt-get update
sudo apt-get install gcc-7
```

[Ref](https://askubuntu.com/questions/1009433/dependency-issues-while-installing-gcc-7-3-from-jonathon-fs-ppa/1009438?noredirect=1)

### Bug: ImportError: No module named apt_pkg

Solution: 

```console
sudo apt-get install python3-apt --reinstall
cd /usr/lib/python3/dist-packages
sudo ln -s apt_pkg.cpython-{35m,36m}-x86_64-linux-gnu.so
```

[Ref]9sudo ln -s apt_pkg.cpython-{35m,36m}-x86_64-linux-gnu.so)

### Copy all files of a particular extension in a directory and it's sub-directories to another folder

```console
mkidr an_empty_folder
find $directory -type f -name \*.txt | xargs cp -t an_empty_folder
```

### Delete the bookmarks to folders in Ubuntu file browser

Use the following command, while you are in file-browser to remove the bookmarks using ```-``` symbol.
```console
Ctrl + b
```

### Find the location where a package is installed
```console
dpkg -L <package_name>
```

Example:
```console
dpkg -L vim
```

[Ref](https://stackoverflow.com/questions/10340281/where-is-ubuntu-storing-installed-programs)

### List all files except the ones with an extension

```console
# Display all files except the one with .txt extension.
ls *.!(txt)
```

### Find the free space available in /home

```console
cd ~/
df -Ph . | tail -1 | awk '{print $4}'
```

### grep excluding multiple directories

```console
grep -inRw -E 'direct' . --exclude-dir={git,log,assets}
```

### Find the number of occurances of a string using grep 

```console
grep -nr <string_to_be_searched> . --include=\*.txt | wc -l
```

### Interactive find and replace in all files of particular extension (*.txt) in all directories and it's subdirectories and so on.

```console
shopt -s globstar
vim -c 'set nomore' -c 'argdo %s/foo/bar/gc' -c xa **/*.txt 
```

[Ref](https://stackoverflow.com/questions/55774223/interactive-find-and-replace-in-all-files-including-those-in-sub-directories-usi#comment98222980_55775069)

### Simple grep searching in a file

```console
Eg: grep 'string_to_be_searched' filename.v
```

### Search for a string in a file and display the line with a match along with 3 lines before it and 2 lines after it.

```console
grep -B 3 -A 2 <string to be searched> <filename>
Eg: grep -B 3 -A 2 foo README.txt
```

[Ref](https://stackoverflow.com/questions/9081/grep-a-file-but-show-several-surrounding-lines)

### Set LDFLAGS in terminal

```console
LDFLAGS="-L/usr/lib/x86_64-linux-gnu"
```

### Running out of disk space?

Use the UI based tool Disk Usage Analyzer (for Ubuntu) to see who is taking how much space.

### Count the number of files in a directory

```console 
ls -l . | egrep -c '^-' 
```

### Killing processes from terminal

```console
ps aux | grep -i vivado
```

### ctags
  
```console
ctags -R --extra=+f *
```

### Merge (or concatenate) two files

```console
cat file1.txt file2.txt > file_merged.txt
```

### Create a new user in Ubuntu using terminal

```console
useradd gitepo
passwd gitrepo
mkdir /home/gitrepo                                      #to create the directory /home/gitrepo
cp /etc/skel/* /home/gitrepo                             #to copy copy files from the /home/gitrepo
chown -R gitrepo:gitrepo /home/gitrepo   #to change the owner of /home/gitrepo to the new user
```

[Ref] https://askubuntu.com/questions/335961/create-default-home-directory-for-existing-user-in-terminal/546090

### Find and replace a string in all files

```console
find /path/to/files -type f -exec sed -i 's/oldstring/new string/g' {} \;
```

[Ref](https://stackoverflow.com/questions/15402770/how-to-grep-and-replace)

### Sort the files in a directory (and sub directories) in descending order of file size

```console
find . -type f  -exec du -h {} + | sort -r -h
```

### CondaHTTPError error using Anaconda
  ERROR

```console
$ conda install pytest
Solving environment: failed

CondaHTTPError: HTTP 000 CONNECTION FAILED for url <https://repo.anaconda.com/pkgs/pro/noarch/repodata.json.bz2>
Elapsed: -

An HTTP error occurred when trying to retrieve this URL.
HTTP errors are often intermittent, and a simple retry will get you on your way.

If your current network has https://www.anaconda.com blocked, please file
a support request with your network engineering team.

ConnectionError(MaxRetryError('HTTPSConnectionPool(host=\'repo.anaconda.com\', port=443): Max retries exceeded with url: /pkgs/pro/noarch/repodata.json.bz2 (Caused by ReadTimeoutError("HTTPSConnectionPool(host=\'repo.anaconda.com\', port=443): Read timed out. (read timeout=9.15)",))',),)
```

SOLUTION

```console
sudo ufw reset
```

[Ref](https://www.howtogeek.com/115116/how-to-configure-ubuntus-built-in-firewall/)

### Network related 

#### If 'Enable Wi-Fi option is disabled' in Ubuntun 16.06

```console
rfkill unblock all
```
    [Ref](https://askubuntu.com/questions/152157/enable-wireless-option-is-disabled-in-network-settings)

#### If wifi icon is not getting displayed in Ubuntu 16.04
```console
    nohup nm-applet &
```

#### Ubuntu network error (Device not ready)
```console
  sudo service network-manager restart
```

#### Ubuntu network error (Not authorized to control networking)
```console
  sudo usermod -G netdev -a vineesh
```
or
```console
  sudo su
  usermod -G netdev -a vineesh
```

#### What to do when the wifi options are not listed and two 'wired' connections are displayed instead of one 'wired' and one 'wireless'
```console
    systemctl restart NetworkManager.service
```
    Ref: (https://askubuntu.com/questions/789843/wired-connection-icon-is-displayed-instead-of-wifi-icon-ubuntu-16-04)

#### Ubuntu Proxy Settings (Credits: https://www.cse.iitb.ac.in/~aamod/ubuntu/install.html##repo)
    Following is the way to get Ubuntu working under IITB proxy with apt-line installation
        For Ubuntu 11.04 and below, go to network proxy.
        Set proxy either netmon.iitb.ac.in port 80 or www.aero.iitb.ac.in port 8081 for all protocols.
        In exclusion list, add *.iitb.ac.in and 10.0.0.0/8.
        Apply system wide
        For Ubuntu 11.10 and above, go to Network from the dash. Network Proxy should be under it. Set proxy as above. 

    Now some files have to be edited:

        Open terminal.
        Type

        sudo gedit /etc/apt/apt.conf /etc/environment /etc/wgetrc 

        This will open 3 files in gedit
        If you are using aero proxy, P=http://www.aero.iitb.ac.in:8081/ . If you are using netmon, P=http://ldapusername:ldappassword@netmon.iitb.ac.in:80/. Use HTTP protocol only. No https://.... or ftp://....
        The /etc/apt/apt.conf should look like 

        Acquire::http::proxy "P";
        Acquire::https::proxy "P";

        ######## P is from previous step
        ##### Notice: No FTP proxy
                    

        For /etc/environment, 

        ##### Something about PATH variable here

        http_proxy=P
        https_proxy=P
        ftp_proxy=P
                    

        For /etc/wgetrc, Uncomment the proxy lines and replace the values by value of P. Uncomment the line use_proxy=on
        Save files, restart Terminal and you are done!!!


#### Ubuntu Repository Settings (Credits: https://www.cse.iitb.ac.in/~aamod/ubuntu/install.html##repo)

    To use IITB apt software repositories in ubuntu, follow the steps:

        Make sure you have no FTP proxy in /etc/apt/apt.conf file. If you have followed proxy instructions from this wiki, you don't need to do anything.
        Make a backup of /etc/apt/sources.list if you want to.
        Open Terminal.
        Type & hit enter 

    sudo gedit /etc/apt/sources.list

	A file will open in gedit. Replace all the contents by 

    ############# Warning: Instead of maverick, use the name of your distribution in following lines
    # For 12.04, its 'precise' 

    deb ftp://ftp.iitb.ac.in/os/ubuntu/archives/ maverick main restricted
    deb-src ftp://ftp.iitb.ac.in/os/ubuntu/archives/ maverick main restricted

    deb ftp://ftp.iitb.ac.in/os/ubuntu/archives/ maverick-updates main restricted
    deb-src ftp://ftp.iitb.ac.in/os/ubuntu/archives/ maverick-updates main restricted

    deb ftp://ftp.iitb.ac.in/os/ubuntu/archives/ maverick universe
    deb-src ftp://ftp.iitb.ac.in/os/ubuntu/archives/ maverick universe
    deb ftp://ftp.iitb.ac.in/os/ubuntu/archives/ maverick-updates universe
    deb-src ftp://ftp.iitb.ac.in/os/ubuntu/archives/ maverick-updates universe

    deb ftp://ftp.iitb.ac.in/os/ubuntu/archives/ maverick multiverse
    deb-src ftp://ftp.iitb.ac.in/os/ubuntu/archives/ maverick multiverse
    deb ftp://ftp.iitb.ac.in/os/ubuntu/archives/ maverick-updates multiverse
    deb-src ftp://ftp.iitb.ac.in/os/ubuntu/archives/ maverick-updates multiverse
                

    Save the file.
    Run sudo apt-get update in Terminal. You are done.
    Now you can install softwares from IITB repositories. They are very fast as compared to HTTP repositories. 


### Cropping pdf in Ubuntu terminal
  Setting proxy in terminal when you have special characters in the username and passowrd
  [Ref](https://www.cyberciti.biz/faq/unix-linux-export-variable-http_proxy-with-special-characters/)

### Cropping pdf in Ubuntu terminal
```console
    pdfcrop --margins '0 0 0 -345' miss_vs_tick.pdf out.pdf
			--margins "<left> <top> <right> <bottom>" (0 0 0 0)
```

#### Saving terminal output to a file

```console
              || visible in terminal ||   visible in file   || existing
      Syntax  ||  StdOut  |  StdErr  ||  StdOut  |  StdErr  ||   file   
    ==========++==========+==========++==========+==========++===========
        >     ||    no    |   yes    ||   yes    |    no    || overwrite
        >>    ||    no    |   yes    ||   yes    |    no    ||  append
              ||          |          ||          |          ||
       2>     ||   yes    |    no    ||    no    |   yes    || overwrite
       2>>    ||   yes    |    no    ||    no    |   yes    ||  append
              ||          |          ||          |          ||
       &>     ||    no    |    no    ||   yes    |   yes    || overwrite
       &>>    ||    no    |    no    ||   yes    |   yes    ||  append
              ||          |          ||          |          ||
     | tee    ||   yes    |   yes    ||   yes    |    no    || overwrite
     | tee -a ||   yes    |   yes    ||   yes    |    no    ||  append
              ||          |          ||          |          ||
     n.e. (*) ||   yes    |   yes    ||    no    |   yes    || overwrite
     n.e. (*) ||   yes    |   yes    ||    no    |   yes    ||  append
              ||          |          ||          |          ||
    |& tee    ||   yes    |   yes    ||   yes    |   yes    || overwrite
    |& tee -a ||   yes    |   yes    ||   yes    |   yes    ||  append
```

[Credits](https://askubuntu.com/questions/420981/how-do-i-save-terminal-output-to-a-file)

#### Ignore files in git
```console
  git rm --cached *.out *.log *.nav *.snm *.toc
```

#### Enable and disable auto-indenting in Vim
  Enable
```console
    :set nopaste
```
  Disable
```console
    :set paste
```

#### Indenting in vim 
  Go to visual mode, select text and press >

#### Paste without indenting in Vim
```console
  :set paste
```
  Shift + Ctrl + v

#### Cropping away white spaces in a pdf file
```console
    pdfcrop --margins '5 10 20 30' wrap.pdf wrap_cropped.pdf 
    [Ref](https://askubuntu.com/questions/124692/command-line-tool-to-crop-pdf-files)

#### Killing vsim in Modelsim
```console
		ps -ef | grep 'vsim'
		kill -9 <pid>
```
#### Killing <defunc> processes in terminal
```console
    ps -ef | grep defunct | grep -v grep | cut -b8-20 | xargs kill -9
```
	[Ref](https://askubuntu.com/questions/201303/what-is-a-defunct-process-and-why-doesnt-it-get-killed
	Example: Kill all the MATLAB processes running in your Ubuntu.
```console
	ps -ef | grep MATLAB | grep -v grep | cut -b8-20 | xargs kill -9
```
	Note: If there are no processes it will give an error related to the usage of _kill_




#### Removing proxy in Ubuntu terminal
```console
    unset http_proxy
    unset https_proxy
```
  [Ref](https://askubuntu.com/questions/465198/how-do-i-temporarily-remove-proxy-settings)

#### Hibernate Ubuntu 16.04 machine
  Choice 1:
```console
  sudo systemctl hibernate
```
  
  Choice 2:
```console
  sudo pm-hibernate
```
    
#### What to do when Ubuntu GUI hangs and not even terminal opens
    * Go to command-line mode. (Press C-A-F3 in Thinkpad E470)
```console
    ps -u
```
    * Check the pid of the process which created the trouble (Eg: 6779)
```console
    kill -9 9779
```
    * Do at your own risk because you will be in trouble, if you kill the wrong process

#### 'Save as' in Vim and edit the new file
```console
    :saveas newFileName
```

#### List all active processes in the machine in terminal
```console
    top
```
    <press 'u'>
    <Enter your username to see the processes you are running>
    
```console
    top -u
```
    <Directly display the processes you are running>

#### Include graphics in your README files using ASCII images
    Ref: http://picascii.com/
#### Sort files based on modification date 
```console
	ll -t
```
#### Sort files based on size
```console
	ls -lSr
```
#### Check folder size in Ubuntu
```console
    du -sh /path/to/directory
```
#### Check the disk space usage by a particular user
```console
    df /home/users/vineeshvs/
```
#### Shorten the bash command line prompt
	* Add the following section to '~/.bashrc'
		```console
		if [ "$color_prompt" = yes ]; then
			PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
		else
			PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
		fi
		```
	* [Ref](http://askubuntu.com/questions/145618/how-can-i-shorten-my-command-line-bash-prompt)

#### Installing Java to open Java enabled webpages in Firefox
	* Tested in Ubuntu 16
```console
	sudo apt-get install icedtea-plugin
	sudo apt-get install default-jre
```
	* Go to firefox and type in the address bar "about:addons"
	* Select 'Plugins' window from the left bar
	* Enable the following plug-in [Selection the option from the dropdown menu on the right to 'Always activate']
		* IcedTea-Web plugin
	* Test the installation
		* Go to the website http://web.cs.iastate.edu/~prabhu/Tutorial/PIPELINE/DLXimplem.html
		* Check if you can see the Java enabled section
	* [Ref](http://askubuntu.com/questions/354361/how-to-install-the-java-plugin-for-firefox/354406)
#### Using GREP
    *grep to search inside files in the same directory. Search for the whole word <-w>
    	```console 
		grep -nrw '.' -e "Input" 
		```
		OR
		```console
		grep -nrw "string_to_be_searched" .
		```
	* Search for only '.v' file extensions (Include '-i' for case-insensitive search)
```console
		grep --color='auto' -nr --include \*.v "SEARCH_TERM" .
```
    * Search excluding certain (<.v> for eg:) extensions. <--color='auto'> is used for highlighting the search term
```console
		grep --color='auto' -nr --exclude \*.v "SEARCH_TERM" .
```
	* Search for words inside a pdf file
```console
		sudo apt-get install pdfgrep
		find /path -iname '*.pdf' -exec pdfgrep pattern {} +
		find . -iname '*.pdf' -exec pdfgrep <string_to_be_searched> {} +
```
#### Using find
    * Recursively look for files with a specific extension
```console
        find $directory -type f -name \*.in
```
	* Find a particular file in a directory and it's subdirectories. (Replace '\*.py' with the file require by you).
```console
        find $directory -type f -name \*.py
```
	* Find a particular file in the particular directory.
```console
	  find <name_of_the_directory> -type f -name '*.extension'
```
#### TODO: INCORRECT: TO BE VERIFIED: Copy all files of particular extension (*.v) found in a directory (libs/) and it's sub-directories to another directory (.). 
```console
	find libs -name '*.v' -exec cp -prv '{}' . ';'
```

#### Installing Ubuntu (Credits: https://www.cse.iitb.ac.in/~aamod/ubuntu/install.html##repo)

    You can either install Ubuntu by downloading the ISO file and creating a bootable device and create a disk partition, OR you can download the Windows Installer and install directly from windows.

    If you have another operating system already, it would be nice to backup your files (just in case). If in case you you blow up you Windows while trying to install Ubuntu (happened to me the first time I tried), you can download Windows from IIT Bombay's MS Store, if your from IIT Bombay. If your not from IIT Bombay, then God help you!

    You then also need to set up proxy settings if you are within the IIT Bombay network and repository settings if you need to install softwares and packages fast:

#### Tar in terminal
    * Compress
```console
		tar -zcvf archive_name.tar.gz folder_to_compress
```
	* Uncompress
```console
		tar xvzf archive_name.tar.gz
```
```console
    tar xf archive_name.xz
```

#### 'Cannot open display error'
	* Use the following command
```console
		DISPLAY=:0
```
#### Error: exit status 1: Autolaunch error: X11 initialization failed. Cannot open display:
    * Solution:
        Added the following lines to ~/.bashrc
```console
            xhost +
            alias sudo='sudo DISPLAY=:0'
```
    * Ref:  
        http://superuser.com/questions/514688/sudo-x11-application-does-not-work-correctly
    * After effects:
        Whenever I open a terminal it will show the warning given below
            access control disabled, clients can connect from any host

#### Mount and unmount so file in termial
    Mount
```console
        sudo mount -o loop /home/vineeshvs/software_installations/SPEC/cpu2006-1.2.iso /media/iso
```
        Ignore the error
```console
            mount: block device /home/vineeshvs/software_installations/SPEC/cpu2006-1.2.iso is write-protected, mounting read-only
```
    Unmount
```console
        sudo umount /media/iso/
```

#### Open an application without going to the directory of the executable: How to append path variable permanently in .bashrc file
	```console
	#Adding path for Modelsim
	export PATH=$PATH:/home/    vineeshvs/altera/13.1/modelsim_ase/bin
	```

#### Change the extension of all files in a folder from .txt to .md
	```console	
	for old in *.txt; do mv $old `basename $old .txt`.md; done
	```

#### Installing newer version of GCC and making it default


	* Revert back to previous version of gcc in case of problems (using *update_alternatives*)

	![Removing the link to latest version and restoring the old version](http://williamdemeo.github.io/linux/update-alternatives.html)

	* Adding gcc-5 PPA to sources.list (Since ```bash sudo add-apt-repository ppa:ubuntu-toolchain-r/test``` gives some *handshake* error)

	![Ref](http://askubuntu.com/questions/61254/how-to-update-gcc-to-the-latest-versionin-this-case-4-7-in-ubuntu-10-04)
	![Ref](http://askubuntu.com/questions/110672/add-apt-repository-returns-unexpected-length-error)

	Adding the following to /etc/apt/sources.list
	```bash deb http://ppa.launchpad.net/ubuntu-toolchain-r/test/ubuntu xenial main ```
	
	```bash 
	sudo apt-get update
	sudo apt-get install gcc-5 g++-5
	```
	
	**Making gcc-5 and g++-5 default**	
```console
	sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 20
	sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 20
		
	**Check if the default version has changed**

	```bash
	wecare@R-58:/var/lib/apt/lists$ gcc --version
	gcc (Ubuntu 5.4.0-3ubuntu1~12.04) 5.4.0 20160603
	Copyright (C) 2015 Free Software Foundation, Inc.
	This is free software; see the source for copying conditions.  There is NO
	warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
	```	
	
	Note: **Checking which file is linked to the software**
		
	```bash 
	ls /usr/bin/gcc -l
	```
#### **Installing software using .tar.bz2 file**
	
	```bash	
	tar jvxf whatever.tar.bz2.
	cd whatever/
	./configure.
	make.
	sudo make install.
	```
#### **Installing software using .tar.gz file**
	
	```bash	
	tar xzf whatever.tar.gz
	cd whatever/
	./configure
	make.
	sudo make install.
	```
#### Unzip in terminal
```console
	unzip file_name.zip
```

#### How to get virtualenv to use dist-packages on Ubuntu? ((**Changing $PYTHONPATH**)

	Note: The common directories where the Python packages will be installed are the following
	
	/usr/lib/python2.7/dist-packages
	/usr/local/lib/python2.7/dist-packages
	/usr/local/lib/python2.7/site-packages

	
	```bash
	vim ~/.bashrc
	```	
	
	Add the following line
	
	```bash
	export PYTHONPATH=$PYTHONPATH:/usr/lib/python2.7/dist-packages:/usr/local/lib/python2.7/dist-packages
	```

	Do the following in terminal
	
	```bash
	source ~/.bashrc
	```	
	
	![Ref1](http://stackoverflow.com/questions/19210964/how-to-get-virtualenv-to-use-dist-packages-on-ubuntu)
	![Finding Python packages](https://leemendelowitz.github.io/blog/how-does-python-find-packages.html)

#### How to remove Python package from terminal (Eg: Removing numpy package)

	```bash
	sudo apt-get remove python-numpy
	```
#### Error: Error deleting partition /dev/sdb2: Command-line 
  Solution: 
```console
  sudo gdisk /dev/dsb2
  type 'd' -> delete the partition 1-4 or whatever number they are suggesting you (give the number 1-4)
  After that 'w' -> it will rewrite the partition table
  It will work
  Windows based solution: Install pc-inspector (retrieve files before formatting)    




		
	
	
