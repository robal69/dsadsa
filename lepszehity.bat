Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces\{2C7B2EE4-D141-4A1C-97DA-E7C9EC9B9B3F}" /v "DhcpGatewayHardwareCount" /t REG_DWORD /d "00000001" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces\{2C7B2EE4-D141-4A1C-97DA-E7C9EC9B9B3F}" /v "DhcpNameServer" /t REG_DWORD /d "192.168.1.1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces\{2C7B2EE4-D141-4A1C-97DA-E7C9EC9B9B3F}" /v "DhcpDefaultGateway" /t REG_DWORD /d "hex(7):31,00,39,00,32,00,2e,00,31,00,36,00,38,00,2e,00,31,\
  00,2e,00,31,00,00,00,00,00" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces\{2C7B2EE4-D141-4A1C-97DA-E7C9EC9B9B3F}" /v "DhcpSubnetMaskOpt" /t REG_DWORD /d "hex(7):32,00,35,00,35,00,2e,00,32,00,35,00,35,00,2e,00,32,\
  00,35,00,35,00,2e,00,30,00,00,00,00,00" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces\{9C1E752A-B125-4651-A60A-2620EDABB7D8}" /v "UseZeroBroadcast" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces\{9C1E752A-B125-4651-A60A-2620EDABB7D8}" /v "EnableDeadGWDetect" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces\{9C1E752A-B125-4651-A60A-2620EDABB7D8}" /v "EnableDHCP" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces\{9C1E752A-B125-4651-A60A-2620EDABB7D8}" /v "NameServer" /t REG_DWORD /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces\{9C1E752A-B125-4651-A60A-2620EDABB7D8}" /v "Domain" /t REG_DWORD /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces\{9C1E752A-B125-4651-A60A-2620EDABB7D8}" /v "RegistrationEnabled" /t REG_DWORD /d "00000001" /f
(
sc config "BITS" start= auto
sc start "BITS"
for /f "tokens=3" %%a in ('sc queryex "BITS" ^| findstr "PID"') do (set pid=%%a)
) >nul 2>&1
wmic process where ProcessId=%pid% CALL setpriority "high"
(
sc config "Dnscache" start= demand
sc start "Dnscache"
for /f "tokens=3" %%a in ('sc queryex "Dnscache" ^| findstr "PID"') do (set pid=%%a)
) >nul 2>&1
wmic process where ProcessId=%pid% CALL setpriority "idle"
cls
wmic process where name="mqsvc.exe" CALL setpriority "high priority"
cls
wmic process where name="mqtgsvc.exe" CALL setpriority "high priority"
cls
wmic process where name="javaw.exe" CALL setpriority "high priority"
cls
wmic process where name="svchost.exe" CALL setpriority "high priority"
cls
wmic process where name="VimeWorld.exe" CALL setpriority "realtime"
etsh int tcp set heuristics enabled
netsh int tcp set global chimney=disabled
netsh int tcp set global autotuninglevel=high
netsh ine tcp show global
netsh interface ipv4 set interface "Enthernet" mtu=1450
wmic process where name="explorer.exe" CALL setpriority "realtime"
cls 
wmic process where ProcessId=%pid% CALL setpriority "high"
cls
netsh int tcp set supplemental template=custom icw=15
netsh int tcp set global fastopen=enabled
netsh interface tcp show global
netsh interface tcp set global autotuninglevel=experimental
netsh interface teredo set refreshinterval=100
netsh int tcp set global hystart=enabled
netsh interface ipv4 set interface "Wi-fi" metric=65
wmic process where name="taskhost.exe" CALL setpriority "high"
cls
wmic process where name="mqsvc.exe" CALL setpriority "high priority"
cls
netsh interface tcp set global congestionprovider=ctcp
Reg.exe add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "CaretTimeout" /t REG_DWORD /d "1000" /f
Reg.exe add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_DWORD /d "1000" /f
for /f "usebackq" %%i in (`reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces`) do (
Reg.exe add %%i /v "TCPNoDelay" /d "1" /t REG_DWORD /f
Reg.exe add %%i /v "TcpAckFrequency" /d "3" /t REG_DWORD /f
Reg.exe add %%i /v "TCPDelAckTicks" /d "0" /t REG_DWORD /f
) >nul 2>&1
cls
