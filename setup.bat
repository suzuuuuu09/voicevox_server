@echo off
chcp 65001

set "FILENAME_1=voicevox_engine-windows-nvidia-0.19.1.7z.001"
set "DOWNLOAD_URL_1=https://github.com/VOICEVOX/voicevox_engine/releases/download/0.19.1/%FILENAME_1%"

curl -L -o "%FILENAME_1%" "%DOWNLOAD_URL_1%"

set "FILENAME_2=voicevox_engine-windows-nvidia-0.19.1.7z.002"
set "DOWNLOAD_URL_2=https://github.com/VOICEVOX/voicevox_engine/releases/download/0.19.1/%FILENAME_2%"
curl -L -o "%FILENAME_2%" "%DOWNLOAD_URL_2%"

"C:\Program Files\7-Zip\7z.exe" x "%FILENAME_1%" -o"Voicevox\"

ren "Voicevox\windows-nvidia" "server"
move /Y "Voicevox" "C:/"

del "%FILENAME_1%" "%FILENAME_2%"

set "FILENAME_SERVER=voicevox_server.bat"
set "DOWNLOAD_URL_SERVER=https://github.com/suzuuuuu09/unity-auto-build-voicevox-server/releases/download/0.2.0/%FILENAME_SERVER%"
curl -L -o "%FILENAME_SERVER%" "%DOWNLOAD_URL_SERVER%"

move /Y "%FILENAME_SERVER%" "C:/Voicevox/"
echo セットアップが完了しました。
pause
