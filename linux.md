### Because teminal is your best friend

### Include graphics in your README files using ASCII images
    Ref: http://picascii.com/

### Sort files based on size
	ls -lSr
### Check folder size in Ubuntu
    du -sh /path/to/directory
### Check the disk space usage by a particular user
    df /home/users/vineeshvs/
### Shorten the bash command line prompt
	* Add the following section to '~/.bashrc'
		```bash
		if [ "$color_prompt" = yes ]; then
			PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
		else
			PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
		fi
		```bash
	* [Ref](http://askubuntu.com/questions/145618/how-can-i-shorten-my-command-line-bash-prompt)

### Installing Java to open Java enabled webpages in Firefox
	* Tested in Ubuntu 16
	* sudo apt-get install icedtea-plugin
	* sudo apt-get install default-jre
	* Go to firefox and type in the address bar "about:addons"
	* Select 'Plugins' window from the left bar
	* Enable the following plug-in [Selection the option from the dropdown menu on the right to 'Always activate']
		* IcedTea-Web plugin
	* Test the installation
		* Go to the website http://web.cs.iastate.edu/~prabhu/Tutorial/PIPELINE/DLXimplem.html
		* Check if you can see the Java enabled section
	* [Ref](http://askubuntu.com/questions/354361/how-to-install-the-java-plugin-for-firefox/354406)
### Using GREP
    *grep to search inside files in the same directory. Search for the whole word <-w>
    	```bash 
		grep -nrw '.' -e "Input" 
		```
		OR
		```bash	
		grep -nrw "string_to_be_searched" .
		```
	* Search for only '.v' file extensions (Include '-i' for case-insensitive search)
		* grep --color='auto' -nr --include \*.v "SEARCH_TERM" .
    * Search excluding certain (<.v> for eg:) extensions. <--color='auto'> is used for highlighting the search term
		* grep --color='auto' -nr --exclude \*.v "SEARCH_TERM" .
	* Search for words inside a pdf file
		sudo apt-get install pdfgrep
		find /path -iname '*.pdf' -exec pdfgrep pattern {} +
		Eg: find . -iname '*.pdf' -exec pdfgrep <string_to_be_searched> {} +
### Using find
    * Recursively look for files with a specific extension
        find $directory -type f -name \*.in

### Installing Ubuntu (Credits: https://www.cse.iitb.ac.in/~aamod/ubuntu/install.html##repo)

    You can either install Ubuntu by downloading the ISO file and creating a bootable device and create a disk partition, OR you can download the Windows Installer and install directly from windows.

    If you have another operating system already, it would be nice to backup your files (just in case). If in case you you blow up you Windows while trying to install Ubuntu (happened to me the first time I tried), you can download Windows from IIT Bombay's MS Store, if your from IIT Bombay. If your not from IIT Bombay, then God help you!

    You then also need to set up proxy settings if you are within the IIT Bombay network and repository settings if you need to install softwares and packages fast:

### Ubuntu Proxy Settings (Credits: https://www.cse.iitb.ac.in/~aamod/ubuntu/install.html##repo)
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

        ###### P is from previous step
        #### Notice: No FTP proxy
                    

        For /etc/environment, 

        #### Something about PATH variable here

        http_proxy=P
        https_proxy=P
        ftp_proxy=P
                    

        For /etc/wgetrc, Uncomment the proxy lines and replace the values by value of P. Uncomment the line use_proxy=on
        Save files, restart Terminal and you are done!!!


## Ubuntu Repository Settings (Credits: https://www.cse.iitb.ac.in/~aamod/ubuntu/install.html##repo)

    To use IITB apt software repositories in ubuntu, follow the steps:

        Make sure you have no FTP proxy in /etc/apt/apt.conf file. If you have followed proxy instructions from this wiki, you don't need to do anything.
        Make a backup of /etc/apt/sources.list if you want to.
        Open Terminal.
        Type & hit enter 

    sudo gedit /etc/apt/sources.list

	```bash        
	A file will open in gedit. Replace all the contents by 

        ########## Warning: Instead of maverick, use the name of your distribution in following lines
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
	```

### Tar in terminal
    * Compress
		tar -zcvf archive_name.tar.gz folder_to_compress
	* Uncompress
		

### 'Cannot open display error'
	* Use the following command
		DISPLAY=:0
### Error: exit status 1: Autolaunch error: X11 initialization failed. Cannot open display:
    * Solution:
        Added the following lines to ~/.bashrc
            xhost +
            alias sudo='sudo DISPLAY=:0'
    * Ref:  
        http://superuser.com/questions/514688/sudo-x11-application-does-not-work-correctly
    * After effects:
        Whenever I open a terminal it will show the warning given below
            access control disabled, clients can connect from any host

### Mount and unmount so file in termial
    Mount
        sudo mount -o loop /home/vineeshvs/software_installations/SPEC/cpu2006-1.2.iso /media/iso
        Ignore the error
            mount: block device /home/vineeshvs/software_installations/SPEC/cpu2006-1.2.iso is write-protected, mounting read-only
    Unmount
        sudo umount /media/iso/

### Open an application without going to the directory of the executable: How to append path variable permanently in .bashrc file
	```bash     
	#Adding path for Modelsim
	export PATH=$PATH:/home/    vineeshvs/altera/13.1/modelsim_ase/bin
	```bash

### Change the extension of all files in a folder from .txt to .md
	```bash	
	for old in *.txt; do mv $old `basename $old .txt`.md; done
	```

### Installing newer version of GCC and making it default


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
### **Installing software using .tar.bz2 file**
	
	```bash	
	tar jvxf whatever.tar.bz2.
	cd whatever/
	./configure.
	make.
	sudo make install.
	```
### **Installing software using .tar.gz file**
	
	```bash	
	tar xzf whatever.tar.gz
	cd whatever/
	./configure
	make.
	sudo make install.
	```
### Unzip in terminal
	unzip file_name.zip

### How to get virtualenv to use dist-packages on Ubuntu? ((**Changing $PYTHONPATH**)

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

### How to remove Python package from terminal (Eg: Removing numpy package)

	```bash
	sudo apt-get remove python-numpy
	```
### Error: Error deleting partition /dev/sdb2: Command-line 
  Solution: sudo gdisk /dev/dsb2
  type 'd' -> delete the partition 1-4 or whatever number they are suggesting you (give the number 1-4)
  After that 'w' -> it will rewrite the partition table
  It will work
  Windows based solution: Install pc-inspector (retrieve files before formatting)    




		
	
	
