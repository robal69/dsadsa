ipconfig /renew
ipconfig /flushdns
netsh int tcp reset
netsh winsock reset
netsh interface tcp set global autotuning=none
cls