# PSTools

## Commands to use psexec from pstools!

If needed, put these parameters on commands, but normally they are not needed. 

Use when accessing some machine under Domain Controller & Active Directory:

`\\HOSTNAME@DOMAIN -u USER -p PASSWORD`

## Running PSExec over SSH

To run applications that needs UI/GUI remotely and starting them on the Windows system, 
do like these examples through SSH on Linux after connecting on Windows:

$ psexec -s -d -i 1 APPLICATION.exe

## Batch files (quietly!)

To run batch scripts remotely, and without showing the cmd window, 
do like these examples:

$ psexec -s -d -i 1 C:/PSExecScripts/Quiet.exe C:/PSExecScripts/BATCH_FILE.bat

## Java Apps

If you need to run an application like something.jar (java), create a .bat file with this inside:

@echo off

java -jar "path/to/.jar" parameters_here

## Run imediately after connecting

You can run these commands automatically from Linux with:

ssh USER@IP_ADDRESS "psexec -s -d -i 1 Quiet.exe C:/path/to/BATCH_FILE.bat"

### The more you know...

If you have some knowledge, you can create the .bat file when connecting SSH with some shell scripting!

## Show custom text through notepad

Write something to a file...

echo test > C:/Temp/test.txt

...and open that file, on the desktop remotely, to someone using Windows see what was writted!

psexec -s -d -i 1 notepad "C:/Temp/test.txt"

# Everything Ok??

Go see files "PowerShell_Commands", "SH_Commands" and/or "NirCMD_Commands.md"!
