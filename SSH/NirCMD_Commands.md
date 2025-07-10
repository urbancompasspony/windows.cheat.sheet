# NirCMD

Auxiliary commands to complement PSExec adding more cool stuff to do!

You need to put the script line inside some .bat file to run it with PSExec through NirCMD.

On examples bellow, there is the example what you can do; then what the line you will put inside some_batch.bat;
And finally, the command you will use through SSH to run that command!

If you put everything under a folder and this folder is on PATH, you will just need to call the application.exe instead of using full path.

## Examples:

### Open the door of J: CD-ROM drive:

nircmd.exe cdrom open j:

psexec -s -d -i 1 Quiet.exe OpenJ.bat

### Close the door of Y: CD-ROM drive	

nircmd.exe cdrom close y:

psexec -s -d -i 1 Quiet.exe CloseJ.bat

### Increase the system volume by 2000 units (out of 65535):

nircmd.exe changesysvolume 2000

psexec -s -d -i 1 Quiet.exe vol2000.bat

### Decrease the system volume by 5000 units (out of 65535):

nircmd.exe changesysvolume -5000

psexec -s -d -i 1 Quiet.exe vol5000.bat

### Set the volume to the highest value:

nircmd.exe setsysvolume 65535

psexec -s -d -i 1 Quiet.exe vol65535.bat

### Mute the system volume:

nircmd.exe mutesysvolume 1

psexec -s -d -i 1 Quiet.exe mute.bat

### Unmute the system volume:

nircmd.exe mutesysvolume 0

psexec -s -d -i 1 Quiet.exe Unmute.bat

### Turn off the monitor:

nircmd.exe monitor off

psexec -s -d -i 1 Quiet.exe monitoroff.bat

### Start the default screen saver:

nircmd.exe screensaver

psexec -s -d -i 1 Quiet.exe screensaver.bat

### Put your computer in 'standby' mode:

nircmd.exe standby

psexec -s -d -i 1 Quiet.exe standby.bat

### log off the current user:

nircmd.exe exitwin logoff

psexec -s -d -i 1 Quiet.exe logoff.bat

### Ask if you want to reboot, and if you answer 'Yes', reboot the computer:

nircmd.exe qboxcom "Do you want to reboot ?" "question" exitwin reboot

psexec -s -d -i 1 Quiet.exe question.bat

### Turn off your computer:

nircmd.exe exitwin poweroff

psexec -s -d -i 1 Quiet.exe poweroff.bat

### Close all your Explorer windows (My Computer, folders, and so on):

nircmd.exe win close class "CabinetWClass"

psexec -s -d -i 1 Quiet.exe close_explorer.bat

### Set the Windows Calculator as top-most window (above all other windows):

nircmd.exe win settopmost title "Calculator" 1

psexec -s -d -i 1 Quiet.exe calc1.bat

### Set the Windows Calculator back to regular window (non top-most window):

nircmd.exe win settopmost title "Calculator" 0

psexec -s -d -i 1 Quiet.exe calc0.bat

### Create a shortcut to Windows calculator under Start Menu->Programs->Calculators:

nircmd.exe shortcut "f:\winnt\system32\calc.exe" "~$folder.programs$\Calculators" "Windows Calculator"

psexec -s -d -i 1 Quiet.exe calc.bat

### Hide the desktop window:

nircmd.exe win hide class progman

psexec -s -d -i 1 Quiet.exe deskhide.bat

### Show the desktop window (After hiding it in previous example):

nircmd.exe win show class progman

psexec -s -d -i 1 Quiet.exe deskshow.bat

### Kill (terminate) all instance of Internet Explorer processes:

nircmd.exe killprocess iexplore.exe

psexec -s -d -i 1 Quiet.exe kill_ie.bat

### Create a shortcut on your desktop that opens the door of K: CDROM drive when you run it:

nircmd.exe cmdshortcut "~$folder.desktop$" "Open CDROM" cdrom open k:

psexec -s -d -i 1 Quiet.exe shrtCD.bat

### Create a shortcut to NirSoft Web site on your desktop:

nircmd.exe urlshortcut "http://www.nirsoft.net" "~$folder.desktop$" "NirSoft"

psexec -s -d -i 1 Quiet.exe shrtURL.bat

### Set the display mode to 800x600x24bit colors:

nircmd.exe setdisplay 800 600 24

psexec -s -d -i 1 Quiet.exe disp.bat

### Copy all shortcuts on your desktop to another folder (f:\temp\desktop):

nircmd.exe execmd copy "~$folder.desktop$\*.lnk" f:\temp\desktop

psexec -s -d -i 1 Quiet.exe copy_shrt.bat

### Restart your IIS (Windows Server):

nircmd.exe service restart w3svc

psexec -s -d -i 1 Quiet.exe IIS.bat

### Restart MySql:

nircmd.exe service restart MySql

psexec -s -d -i 1 Quiet.exe mysql.bat

### Open the desired Registry key/value in RegEdit:

nircmd.exe regedit "HKLM\Software\Microsoft\Windows\CurrentVersion" "CommonFilesDir"

psexec -s -d -i 1 Quiet.exe openregedit.bat

#### Open the Registry key that you copied to the clipboard in RegEdit:

nircmd regedit "~$clipboard$"

psexec -s -d -i 1 Quiet.exe clipregedit.bat

### Disable the screen saver:

nircmd.exe regsetval sz "HKCU\control panel\desktop" "ScreenSaveActive" 0

psexec -s -d -i 1 Quiet.exe screensaver0.bat

### Enable the screen saver:

nircmd.exe regsetval sz "HKCU\control panel\desktop" "ScreenSaveActive" 1

psexec -s -d -i 1 Quiet.exe screensaver1.bat

### Empty the recycle bin in all drives:

nircmd.exe emptybin

psexec -s -d -i 1 Quiet.exe bin.bat

### Answer 'Yes' to a standard Windows message-box:

nircmd.exe dlg "" "" click yes

psexec -s -d -i 1 Quiet.exe yes.bat

### Wait 2 seconds, and then save the current screen to shot.png (Take carefull about privacy!)

nircmd.exe cmdwait 2000 savescreenshot "f:\temp\shot.png"

psexec -s -d -i 1 Quiet.exe srnsht.bat

### Save 10 screenshots in a loop, and wait 60 seconds between the screenshot save calls. The filenames of the screenshot will contain the time and date of the saved screenshot.	

nircmd.exe loop 10 60000 savescreenshot c:\temp\scr~$currdate.MM_dd_yyyy$-~$currtime.HH_mm_ss$.png

psexec -s -d -i 1 Quiet.exe sequential_scrnsht.bat

### Wait until Firefox is closed, and then say "Firefox was closed"	

nircmd.exe waitprocess firefox.exe speak text "Firefox was closed"

psexec -s -d -i 1 Quiet.exe fire.bat

## I don't tested all codes above!
Some maybe not work.
