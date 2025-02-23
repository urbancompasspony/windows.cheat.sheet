# Check CAL Time Left

## PowerShell:
(Invoke-WmiMethod -PATH (gwmi -namespace root\cimv2\terminalservices -class win32_terminalservicesetting).__PATH -name GetGracePeriodDays).daysleft

## CMD:
wmic /namespace:\\root\CIMV2\TerminalServices PATH Win32_TerminalServiceSetting WHERE (__CLASS !="") CALL GetGracePeriodDays

