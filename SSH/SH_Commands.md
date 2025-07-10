# SH_Commands

Some examples to handle some strings and parameters.

## Catch Windows Uptime and stores under a var:

var1=$(ssh USER@IP_OF_SYSTEM "net statistics workstation" | awk 'NR==4' | awk '{print $3, $4}')

## Check if a specific SERVICE is running or stopped

Example: Xbox Live Network Service

var1=$(ssh USER@IP_OF_SYSTEM 'Get-Service | Where-Object {$_.Name -eq "XboxNetApiSvc"}' | awk 'NR==4' | awk '{print $1}')

`[ "$var1" = "Stopped" ] && {
  echo "do something because is stopped"
} || {
  echo "do nothing because is running"
}`

## Check if a specific PROCESS is running or stopped

Example: winlogon

var1=$(ssh USER@IP_OF_SYSTEM 'Get-Process | Where-Object {$_.Name -eq "winlogon"}' | awk 'NR==4' | awk '{print $8}')

`[ "$var1" = "winlogon" ] && {
  echo "do something because is running"
} || {
  echo "do nothing because is stopped"
}`

##
