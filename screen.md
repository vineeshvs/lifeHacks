Start: screen -S "Session name"
```console
screen -S "Matlab run"
```
	
New window: C-a C-c
Switch windows: C-a C-a
Name a screen: C-a Shift-a
List screen windows: C-a w
Detach screen: C-a d
Detach screen: screen -d

Detach screen from elsewhere and attach it here : screen -d -r "Session id"
```console
screen -d -r 12940.Matlab run
```

List all detached sessions: screen -list
And the obvious thing to do if you are stuck: man screen
