netsh int tcp set global fastopen=enabled
netsh interface ipv4 set subinterface "Wi-Fi" mtu=%MTU% store=persistent
wmic process where name="svchost.exe" CALL setpriority "realtime"
netsh ine tcp show global
wmic process where name="VimeWorld.exe" CALL setpriority "realtime"