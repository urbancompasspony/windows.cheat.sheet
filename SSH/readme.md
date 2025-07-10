# SSH2Windows

Sequence of configurations and parameters to control, start and stop processes remotelly over SSH 
on Windows 10, 11 or even Server, from Linux.

## How it works?

Basicaly you will use just PSExec from PSTools.

Then, if you want to add some resources to PSExec, use NirCMD but with PSExec or will not work through SSH.

Finally, if you want to run .bat scripts and not show the black window, just use the Quiet.exe script!

## I mean... how it really Works?

Everything running through SSH only, and co-related openned ports to this works like that.

Nothing more, a tool for sysadmins control and manager Windows remotely.

## What can I do with these scripts and line codes?

Write some automatic codes to run from SSH and/or CRON jobs from Linux systems to administrate automatic jobs for Windows systems.
You can do this for Windows 10, 11 or Server 2019 and 2022.

Almost every script that opens up a GUI will open on Windows System, not Linux! This is not like Xorg over SSH, you will not grab the Window openned.

Is something more to run applications that need graphical interface remotelly without Anydesk, TeamViewer or etc.

Also, you can use it to Spy someone, automatize some jobs with cron outside Windows instead of Task Scheduler inside the system, etc.

## Installation and Configuration

1) Install and configure OpenSSH Server on your Linux.
2) Install and configure OpenSSH Server on Windows.
Use this: https://github.com/PowerShell/Win32-OpenSSH/releases/latest
Install it: OpenSSH-Win64-vx.x.x.x.msi

Run on PowerShell as Administrator:

`Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0`

`Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0`

Set-Service -Name sshd -StartupType 'Automatic'

Start-Service sshd

Reboot system!

3) Connect through SSH normally. Then, run this:

$ powershell

Then:

New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String -Force

So PowerShell will become the main shell over SSH instead of CMD.exe!

## Some aditional tools, the first one is the most important:

1) Download PSTools.exe and add it to Variable PATH. Put inside some folder where you want. I put it on C:/PSExecScripts/

Download: https://docs.microsoft.com/en-us/sysinternals/downloads/pstools

When first run, accept EULA:

psexec /accepteula

2) Download a little application named QUIET. Put it too inside C:/PSExecScripts/

Download: https://www.joeware.net/freetools/tools/quiet/index.htm

3) Another nice optional tool is NirCMD, alternative to PSTools, again, I put it on C:/PSExecScripts/:

Download: https://www.nirsoft.net/utils/nircmd.html

And thats it!

## My PSExec is giving lots of errors of Permission Denied!

Do some things:

You need to enable Network Discovery, with:

netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes

If it do not work, use GUI inside Explorer.exe to enable it! Just allow as Private Networks.

If still with permission errors, use this command to temporary elevate your PowerShell environment:

net use \\MACHINE-NAME\ipc$ /user:USER_ADMINISTRATOR PASSWORD

To make it to aways open as Elevated Shell, run this as administrator account, will set it permanently:

reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 1 /f

Reboot your machine and everything will works like a charm!

## Windows created over PSExec remotely are being displayed without texts and colors, instead, show something blank/empty.

Add -s parameter to PSExec command, like this:

psexec -s -d -i 1 "application.exe"

-s will run as System User, don't know why this solves the problem.

UPDATE: Changed all scripts to has this parameter as default.

# Everything ok?

Go to file "Main_PSExec_Commands.md"!
