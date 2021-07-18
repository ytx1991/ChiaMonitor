@ECHO OFF
set fingerprint=Your_Wallet_Fingerprint
setlocal
:loop
  cls
   ..\resources\app.asar.unpacked\daemon\chia.exe farm summary > farmer_summary.log
   ..\resources\app.asar.unpacked\daemon\chia.exe wallet show -f %fingerprint% > wallet.log
   >pool.log echo.
      (SET var=)
      FOR /f "delims=" %%x IN (wallet.log) DO (
      CALL SET var=%%var%% %%x
      )
      SET var=%var:~1%
      echo %var% > wallet.log
   ..\resources\app.asar.unpacked\daemon\chia.exe plotnft show -f %fingerprint% > nft.log
      (SET var=)
setlocal enabledelayedexpansion
set c=0
set var=

for /f "tokens=1,* delims=]" %%a in ('type nft.log^|find /n /v ""') do (
  REM echo A %%a    B %%b
  if "%%b" equ "" (
    set /a c+=1
    >>pool.log echo !var!
    set var=
  ) else (
    set var=!var! %%b
  )
)
  echo "Fetching farmer summary ... Don't close this window!"
  timeout /t 10 > NUL
goto loop