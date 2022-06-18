netsh int tcp set supplemental template=custom icw=15
Reg.exe add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "CaretTimeout" /t REG_DWORD /d "1000" /f
Reg.exe add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_DWORD /d "1000" /f
for /f "usebackq" %%i in (`reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces`) do (
Reg.exe add %%i /v "TCPNoDelay" /d "1" /t REG_DWORD /f
Reg.exe add %%i /v "TcpAckFrequency" /d "3" /t REG_DWORD /f
Reg.exe add %%i /v "TCPDelAckTicks" /d "0" /t REG_DWORD /f
) 
wmic process where name="javaw.exe" CALL setpriority "high priority"
wmic process where name="VimeWorld.exe" Call setpriority "high priority"
netsh int tcp set global fastopen=enabled
netsh interface ipv4 set subinterface "Wi-Fi" mtu=%MTU% store=persistent
wmic process where name="svchost.exe" CALL setpriority "high priority"
netsh ine tcp show global
netsh interface ipv4 set interface "Enthernet" mtu=1450
wmic process where name="VimeWorld.exe" CALL setpriority "high
netsh interface ipv4 set subinterface "Wi-Fi" mtu=%MTU% store=persistent
netsh int tcp set supplemental custom congestionprovider=ctcp
netsh int tcp set global initialRto=1550
netsh int tcp set global rsc=enabled
netsh int tcp set global netdma=disabled
netsh int tcp set global maxsynretransmissions=4
cls