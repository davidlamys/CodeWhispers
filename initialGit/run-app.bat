@echo off

if "%1" == "" goto bad

if "%2" == "" goto doit

:bad
  echo Proper Usage:
  echo run-app.bat [ChineseWhisperIPAddress]
  goto :eof


:doit
  #clean output dir
  DELTREE ./out
  MD ./out

  #compile
  echo "Compiling classes to out folder"
  javac -classpath .\lib\"*" -d out -sourcepath ./src ./src/*.java

  #run
  echo "Running the app using question server $1"
  java -classpath .\lib\"*":./out Whisper $1