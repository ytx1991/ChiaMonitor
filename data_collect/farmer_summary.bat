@ECHO OFF
:loop
  cls
   ..\resources\app.asar.unpacked\daemon\chia.exe farm summary > farmer_summary.log
  echo "Fetching farmer summary ... Don't close this window!"
  timeout /t 5 > NUL
goto loop