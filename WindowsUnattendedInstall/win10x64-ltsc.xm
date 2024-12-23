<?xml version="1.0" encoding="UTF-8"?>
<unattend xmlns="urn:schemas-microsoft-com:unattend" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State">
  <settings pass="windowsPE">
    <component name="Microsoft-Windows-International-Core-WinPE" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <SetupUILanguage>
        <UILanguage>en-US</UILanguage>
      </SetupUILanguage>
      <InputLocale>0409:00000409</InputLocale>
      <SystemLocale>en-US</SystemLocale>
      <UILanguage>en-US</UILanguage>
      <UserLocale>en-US</UserLocale>
    </component>
    <component name="Microsoft-Windows-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <DiskConfiguration>
        <Disk wcm:action="add">
          <DiskID>0</DiskID>
          <WillWipeDisk>true</WillWipeDisk>
          <CreatePartitions>
            <!-- System partition (ESP) -->
            <CreatePartition wcm:action="add">
              <Order>1</Order>
              <Type>EFI</Type>
              <Size>128</Size>
            </CreatePartition>
            <!-- Microsoft reserved partition (MSR) -->
            <CreatePartition wcm:action="add">
              <Order>2</Order>
              <Type>MSR</Type>
              <Size>128</Size>
            </CreatePartition>
            <!-- Windows partition -->
            <CreatePartition wcm:action="add">
              <Order>3</Order>
              <Type>Primary</Type>
              <Extend>true</Extend>
            </CreatePartition>
          </CreatePartitions>
          <ModifyPartitions>
            <!-- System partition (ESP) -->
            <ModifyPartition wcm:action="add">
              <Order>1</Order>
              <PartitionID>1</PartitionID>
              <Label>System</Label>
              <Format>FAT32</Format>
            </ModifyPartition>
            <!-- MSR partition does not need to be modified -->
            <ModifyPartition wcm:action="add">
              <Order>2</Order>
              <PartitionID>2</PartitionID>
            </ModifyPartition>
            <!-- Windows partition -->
            <ModifyPartition wcm:action="add">
              <Order>3</Order>
              <PartitionID>3</PartitionID>
              <Label>Windows</Label>
              <Letter>C</Letter>
              <Format>NTFS</Format>
            </ModifyPartition>
          </ModifyPartitions>
        </Disk>
      </DiskConfiguration>
      <ImageInstall>
        <OSImage>
          <InstallFrom>
           <MetaData wcm:action="add">
              <Key>/image/index</Key>
              <Value>1</Value>
            </MetaData>
          </InstallFrom>
          <InstallTo>
            <DiskID>0</DiskID>
            <PartitionID>3</PartitionID>
          </InstallTo>
          <InstallToAvailablePartition>false</InstallToAvailablePartition>
        </OSImage>
      </ImageInstall>
      <DynamicUpdate>
        <Enable>true</Enable>
        <WillShowUI>Never</WillShowUI>
      </DynamicUpdate>
      <UpgradeData>
        <Upgrade>false</Upgrade>
        <WillShowUI>Never</WillShowUI>
      </UpgradeData>
      <UserData>
        <AcceptEula>true</AcceptEula>
        <FullName>Docker</FullName>
        <Organization>Windows for Docker</Organization>
      </UserData>
      <EnableFirewall>false</EnableFirewall>
      <Diagnostics>
        <OptIn>false</OptIn>
      </Diagnostics>
    </component>
    <component name="Microsoft-Windows-PnpCustomizationsWinPE" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <DriverPaths>
        <PathAndCredentials wcm:action="add" wcm:keyValue="1">
          <Path>D:\viostor\w10\amd64</Path>
        </PathAndCredentials>
        <PathAndCredentials wcm:action="add" wcm:keyValue="2">
          <Path>D:\NetKVM\w10\amd64</Path>
        </PathAndCredentials>
        <PathAndCredentials wcm:action="add" wcm:keyValue="3">
          <Path>D:\Balloon\w10\amd64</Path>
        </PathAndCredentials>
        <PathAndCredentials wcm:action="add" wcm:keyValue="4">
          <Path>D:\pvpanic\w10\amd64</Path>
        </PathAndCredentials>
        <PathAndCredentials wcm:action="add" wcm:keyValue="5">
          <Path>D:\qemupciserial\w10\amd64</Path>
        </PathAndCredentials>
        <PathAndCredentials wcm:action="add" wcm:keyValue="6">
          <Path>D:\qxldod\w10\amd64</Path>
        </PathAndCredentials>
        <PathAndCredentials wcm:action="add" wcm:keyValue="7">
          <Path>D:\vioinput\w10\amd64</Path>
        </PathAndCredentials>
        <PathAndCredentials wcm:action="add" wcm:keyValue="8">
          <Path>D:\viorng\w10\amd64</Path>
        </PathAndCredentials>
        <PathAndCredentials wcm:action="add" wcm:keyValue="9">
          <Path>D:\vioscsi\w10\amd64</Path>
        </PathAndCredentials>
        <PathAndCredentials wcm:action="add" wcm:keyValue="10">
          <Path>D:\vioserial\w10\amd64</Path>
        </PathAndCredentials>
        <PathAndCredentials wcm:action="add" wcm:keyValue="11">
          <Path>D:\viogpudo\w10\amd64</Path>
        </PathAndCredentials>
        <PathAndCredentials wcm:action="add" wcm:keyValue="12">
          <Path>D:\sriov\w10\amd64</Path>
        </PathAndCredentials>
        <PathAndCredentials wcm:action="add" wcm:keyValue="13">
          <Path>D:\viofs\w10\amd64</Path>
        </PathAndCredentials>
      </DriverPaths>
    </component>
  </settings>
  <settings pass="offlineServicing">
    <component name="Microsoft-Windows-LUA-Settings" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <EnableLUA>false</EnableLUA>
    </component>
  </settings>
  <settings pass="generalize">
    <component name="Microsoft-Windows-PnPSysprep" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <PersistAllDeviceInstalls>true</PersistAllDeviceInstalls>
    </component>
    <component name="Microsoft-Windows-Security-SPP" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <SkipRearm>1</SkipRearm>
    </component>
  </settings>
  <settings pass="specialize">
    <component name="Microsoft-Windows-Security-SPP-UX" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <SkipAutoActivation>true</SkipAutoActivation>
    </component>
    <component name="Microsoft-Windows-Shell-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <ComputerName>*</ComputerName>
      <OEMInformation>
        <Manufacturer>Dockur</Manufacturer>
        <Model>Windows for Docker</Model>
        <SupportHours>24/7</SupportHours>
        <SupportPhone />
        <SupportProvider>Dockur</SupportProvider>
        <SupportURL>https://github.com/dockur/windows/issues</SupportURL>
      </OEMInformation>
      <OEMName>Windows for Docker</OEMName>
    </component>
    <component name="Microsoft-Windows-ErrorReportingCore" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <DisableWER>1</DisableWER>
    </component>
    <component name="Microsoft-Windows-IE-InternetExplorer" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <DisableAccelerators>true</DisableAccelerators>
      <DisableFirstRunWizard>true</DisableFirstRunWizard>
      <Home_Page>https://google.com</Home_Page>
      <Help_Page>about:blank</Help_Page>
    </component>
    <component name="Microsoft-Windows-IE-InternetExplorer" processorArchitecture="wow64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <DisableAccelerators>true</DisableAccelerators>
      <DisableFirstRunWizard>true</DisableFirstRunWizard>
      <Home_Page>https://google.com</Home_Page>
      <Help_Page>about:blank</Help_Page>
    </component>
    <component name="Microsoft-Windows-SQMApi" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <CEIPEnabled>0</CEIPEnabled>
    </component>
    <component name="Microsoft-Windows-SystemRestore-Main" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <DisableSR>1</DisableSR>
    </component>
    <component name="Microsoft-Windows-International-Core" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <InputLocale>0409:00000409</InputLocale>
      <SystemLocale>en-US</SystemLocale>
      <UILanguage>en-US</UILanguage>
      <UserLocale>en-US</UserLocale>
    </component>
    <component name="Microsoft-Windows-Deployment" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <RunSynchronous>
        <RunSynchronousCommand wcm:action="add">
          <Order>1</Order>
          <Path>reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v BypassNRO /t REG_DWORD /d 1 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>2</Order>
          <Path>reg.exe load "HKU\mount" "C:\Users\Default\NTUSER.DAT"</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>3</Order>
          <Path>reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d 0 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>4</Order>
          <Path>reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "FeatureManagementEnabled" /t REG_DWORD /d 0 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>5</Order>
          <Path>reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OEMPreInstalledAppsEnabled" /t REG_DWORD /d 0 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>6</Order>
          <Path>reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d 0 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>7</Order>
          <Path>reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d 0 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>8</Order>
          <Path>reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>9</Order>
          <Path>reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d 0 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>10</Order>
          <Path>reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContentEnabled" /t REG_DWORD /d 0 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>11</Order>
          <Path>reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d 0 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>12</Order>
          <Path>reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d 0 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>13</Order>
          <Path>reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>14</Order>
          <Path>reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d 0 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>15</Order>
          <Path>reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 0 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>16</Order>
          <Path>reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353698Enabled" /t REG_DWORD /d 0 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>17</Order>
          <Path>reg.exe add "HKU\mount\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>18</Order>
          <Path>reg.exe add "HKU\mount\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableCloudOptimizedContent" /t REG_DWORD /d 1 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>19</Order>
          <Path>reg.exe add "HKU\mount\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 1 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>20</Order>
          <Path>reg.exe add "HKU\mount\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableConsumerAccountStateContent" /t REG_DWORD /d 1 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>21</Order>
          <Path>reg.exe unload "HKU\mount"</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>22</Order>
          <Path>reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableCloudOptimizedContent" /t REG_DWORD /d 1 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>23</Order>
          <Path>reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 1 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>24</Order>
          <Path>reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableConsumerAccountStateContent" /t REG_DWORD /d 1 /f</Path>
        </RunSynchronousCommand>
        <RunSynchronousCommand wcm:action="add">
          <Order>25</Order>
          <Path>reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\NetworkList\Signatures\FirstNetwork" /v Category /t REG_DWORD /d 1 /f</Path>
          <Description>Set Network Location to Home</Description>
        </RunSynchronousCommand>
      </RunSynchronous>
    </component>
    <component name="Microsoft-Windows-TerminalServices-LocalSessionManager" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <fDenyTSConnections>false</fDenyTSConnections>
    </component>
    <component name="Microsoft-Windows-TerminalServices-RDP-WinStationExtensions" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <UserAuthentication>0</UserAuthentication>
    </component>
    <component name="Networking-MPSSVC-Svc" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <FirewallGroups>
        <FirewallGroup wcm:action="add" wcm:keyValue="RemoteDesktop">
          <Active>true</Active>
          <Profile>all</Profile>
          <Group>@FirewallAPI.dll,-28752</Group>
        </FirewallGroup>
      </FirewallGroups>
    </component>
  </settings>
  <settings pass="auditSystem" />
  <settings pass="auditUser" />
  <settings pass="oobeSystem">
    <component name="Microsoft-Windows-SecureStartup-FilterDriver" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <PreventDeviceEncryption>true</PreventDeviceEncryption>
    </component>
    <component name="Microsoft-Windows-EnhancedStorage-Adm" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <TCGSecurityActivationDisabled>1</TCGSecurityActivationDisabled>
    </component>
    <component name="Microsoft-Windows-Shell-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
      <UserAccounts>
        <LocalAccounts>
          <LocalAccount wcm:action="add">
            <Name>Docker</Name>
            <Group>Administrators</Group>
            <Password>
              <Value />
              <PlainText>true</PlainText>
            </Password>
          </LocalAccount>
        </LocalAccounts>
        <AdministratorPassword>
          <Value>password</Value>
          <PlainText>true</PlainText>
        </AdministratorPassword>
      </UserAccounts>
      <AutoLogon>
        <Username>Docker</Username>
        <Enabled>true</Enabled>
        <LogonCount>65432</LogonCount>
        <Password>
          <Value />
          <PlainText>true</PlainText>
        </Password>
      </AutoLogon>
      <Display>
        <ColorDepth>32</ColorDepth>
        <HorizontalResolution>1920</HorizontalResolution>
        <VerticalResolution>1080</VerticalResolution>
      </Display>
      <OOBE>
        <HideEULAPage>true</HideEULAPage>
        <HideLocalAccountScreen>true</HideLocalAccountScreen>
        <HideOEMRegistrationScreen>true</HideOEMRegistrationScreen>
        <HideOnlineAccountScreens>true</HideOnlineAccountScreens>
        <HideWirelessSetupInOOBE>true</HideWirelessSetupInOOBE>
        <NetworkLocation>Home</NetworkLocation>
        <ProtectYourPC>3</ProtectYourPC>
        <SkipUserOOBE>true</SkipUserOOBE>
        <SkipMachineOOBE>true</SkipMachineOOBE>
      </OOBE>
      <RegisteredOrganization>Dockur</RegisteredOrganization>
      <RegisteredOwner>Windows for Docker</RegisteredOwner>
      <FirstLogonCommands>
        <SynchronousCommand wcm:action="add">
          <Order>1</Order>
          <CommandLine>reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "AllowInsecureGuestAuth" /t REG_DWORD /d 1 /f</CommandLine>
          <Description>Allow guest access to network shares</Description>
        </SynchronousCommand>
        <SynchronousCommand wcm:action="add">
          <Order>2</Order>
          <CommandLine>reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse /t REG_DWORD /d 0 /f</CommandLine>
          <Description>Allow RDP login with blank password</Description>
        </SynchronousCommand>
        <SynchronousCommand wcm:action="add">
          <Order>3</Order>
          <CommandLine>reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device" /v "DevicePasswordLessBuildVersion" /t REG_DWORD /d 0 /f</CommandLine>
          <Description>Enable option for passwordless sign-in</Description>
        </SynchronousCommand>
        <SynchronousCommand wcm:action="add">
          <Order>4</Order>
          <CommandLine>cmd /C wmic useraccount where name="Docker" set PasswordExpires=false</CommandLine>
          <Description>Password Never Expires</Description>
        </SynchronousCommand>
        <SynchronousCommand wcm:action="add">
          <Order>5</Order>
          <CommandLine>cmd /C POWERCFG -H OFF</CommandLine>
          <Description>Disable Hibernation</Description>
        </SynchronousCommand>
        <SynchronousCommand wcm:action="add">
          <Order>6</Order>
          <CommandLine>cmd /C POWERCFG -X -monitor-timeout-ac 0</CommandLine>
          <Description>Disable monitor blanking</Description>
        </SynchronousCommand>
        <SynchronousCommand wcm:action="add">
          <Order>7</Order>
          <CommandLine>reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "HideFirstRunExperience" /t REG_DWORD /d 1 /f</CommandLine>
          <Description>Disable first-run experience in Edge</Description>
        </SynchronousCommand>
        <SynchronousCommand wcm:action="add">
          <Order>8</Order>
          <CommandLine>reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f</CommandLine>
          <Description>Show file extensions in Explorer</Description>
        </SynchronousCommand>
        <SynchronousCommand wcm:action="add">
          <Order>9</Order>
          <CommandLine>reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateFileSizePercent" /t REG_DWORD /d 0 /f</CommandLine>
          <Description>Zero Hibernation File</Description>
        </SynchronousCommand>
        <SynchronousCommand wcm:action="add">
          <Order>10</Order>
          <CommandLine>reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d 0 /f</CommandLine>
          <Description>Disable Hibernation</Description>
        </SynchronousCommand>
        <SynchronousCommand wcm:action="add">
          <Order>11</Order>
          <CommandLine>cmd /C POWERCFG -X -standby-timeout-ac 0</CommandLine>
          <Description>Disable Sleep</Description>
        </SynchronousCommand>
        <SynchronousCommand wcm:action="add">
          <Order>12</Order>
          <CommandLine>reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnlistedRemotePrograms" /t REG_DWORD /d 1 /f</CommandLine>
          <Description>Enable RemoteAPP to launch unlisted programs</Description>
        </SynchronousCommand>
        <SynchronousCommand wcm:action="add">
          <Order>13</Order>
          <CommandLine>reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f</CommandLine>
          <Description>Remove Search from the Taskbar</Description>
        </SynchronousCommand>
        <SynchronousCommand wcm:action="add">
          <Order>14</Order>
          <CommandLine>reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f</CommandLine>
          <Description>Remove Task View from the Taskbar</Description>
        </SynchronousCommand>
        <SynchronousCommand wcm:action="add">
          <Order>15</Order>
          <CommandLine>reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d 0 /f</CommandLine>
          <Description>Remove Widgets from the Taskbar</Description>
        </SynchronousCommand>
        <SynchronousCommand wcm:action="add">
          <Order>16</Order>
          <CommandLine>reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d 0 /f</CommandLine>
          <Description>Remove Chat from the Taskbar</Description>
        </SynchronousCommand>
        <SynchronousCommand wcm:action="add">
          <Order>17</Order>
          <CommandLine>reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d 1 /f</CommandLine>
          <Description>Turn off Windows Update auto download</Description>
        </SynchronousCommand>
        <SynchronousCommand wcm:action="add">
          <Order>18</Order>
          <CommandLine>netsh advfirewall firewall set rule group="@FirewallAPI.dll,-32752" new enable=Yes</CommandLine>
          <Description>Enable Network Discovery</Description>
        </SynchronousCommand>
        <SynchronousCommand wcm:action="add">
          <Order>19</Order>
          <CommandLine>netsh advfirewall firewall set rule group="@FirewallAPI.dll,-28502" new enable=Yes</CommandLine>
          <Description>Enable File Sharing</Description>
        </SynchronousCommand>
        <SynchronousCommand wcm:action="add">
          <Order>20</Order>
          <CommandLine>cmd /C if exist "C:\OEM\install.bat" start "Install" "cmd /C C:\OEM\install.bat"</CommandLine>
          <Description>Execute custom script from the OEM folder if exists</Description>
        </SynchronousCommand>
      </FirstLogonCommands>
    </component>
  </settings>
</unattend>
