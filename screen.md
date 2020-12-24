#### Quickstart
   
    Start a new session: screen -S "Session name"
    New window: C-a C-c
    Switch windows: C-a C-a
    Name a screen: C-a Shift-a
    List screen windows: C-a w
    Detach screen: C-a d
    Detach screen: screen -d

Detach screen from elsewhere and attach it here : 
    
    screen -d -r "Session id"
    e.g.: screen -d -r 12940.Matlab run

List all detached sessions: 
    
    screen -listk

More details on screen 
    
    man screen

[Kill all screens](https://unix.stackexchange.com/questions/94527/how-do-i-kill-all-screens)

    killall screen 


#### Examples
* Created screen

      screen -S "ga-run"

* Detatched
        
      C-a d

* Listing the active screens

      screen -list

* Output is as follows

        [vineeshvs@vlsi28 ga]$ screen -list
        There is a screen on:
            7031.ga-run	(Detached)
        1 Socket in /var/run/screen/S-vineeshvs.

* Re-attached the active screen

        screen -r 7031.ga-run

#### Advanced

* Kill the current screen

    C-a k

* Screen is stuck?

    C-a q

#### Errors
##### Cannot find termcap entry for 'xterm-256color'

Quick fix: run `TERM=xterm screen` instead of `screen`.

[Ref](https://stackoverflow.com/questions/10823994/unix-screen-utility-error-cannot-find-termcap-entry-for-xterm-256color)