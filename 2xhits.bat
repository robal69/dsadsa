netsh int tcp set global autotuning=high
netsh int tcp set global dca=enabled
netsh int tcp set global rss=enabled
netsh int tcp set global netdma=enabled
netsh int tcp set global timestamps=enabled
netsh int tcp set global nonsackrttresiliency=ctcp
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