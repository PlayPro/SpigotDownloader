@ECHO OFF

set buildtools=%cd%\BuildTools
if not exist "%buildtools%" mkdir %buildtools%
bitsadmin.exe /transfer "BuildTools" https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar %buildtools%\BuildTools.jar
cd %buildtools%
java -Xmx1024M -jar BuildTools.jar --rev 1.14.1
cd ..
xcopy /y %buildtools%\spigot-1.14.1.jar %cd%

PAUSE