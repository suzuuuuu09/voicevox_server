@echo off
chcp 932
setlocal

set "reg_key=HKLM\SOFTWARE\7-Zip"
set "ZIP_PATH="

reg query "%reg_key%" >nul 2>&1
if %errorlevel%==0 (
    for /f "tokens=2*" %%A in ('reg query "%reg_key%" /v Path 2^>nul') do (
        set "ZIP_PATH=%%B"
    )

    if not defined ZIP_PATH (
        echo 7-Zipがインストールされていません。インストールを開始します。
        @REM 7-Zipインストール
        winget install --id 7zip.7zip -e
        if %errorlevel%==0 (
            echo 7-Zipのインストールが完了しました。
            echo もう一度実行してください。
            pause
            exit /b
        ) else (
            echo 7-Zipのインストールに失敗しました。
            pause
            exit /b
        )
    )
) else (
    echo 7-Zipがインストールされていません。インストールを開始します。
    @REM 7-Zipインストール
    winget install --id 7zip.7zip -e
    if %errorlevel%==0 (
        echo 7-Zipのインストールが完了しました。
        echo もう一度実行してください。
        pause
        exit /b
    ) else (
        echo 7-Zipのインストールに失敗しました。
        pause
        exit /b
    )
)

set "FILENAME_1=voicevox_engine-windows-nvidia-0.19.1.7z.001"
set "DOWNLOAD_URL_1=https://github.com/VOICEVOX/voicevox_engine/releases/download/0.19.1/%FILENAME_1%"
del "%FILENAME_1%"
curl -L -o "%FILENAME_1%" "%DOWNLOAD_URL_1%"

set "FILENAME_2=voicevox_engine-windows-nvidia-0.19.1.7z.002"
set "DOWNLOAD_URL_2=https://github.com/VOICEVOX/voicevox_engine/releases/download/0.19.1/%FILENAME_2%"
del "%FILENAME_2%"
curl -L -o "%FILENAME_2%" "%DOWNLOAD_URL_2%"

if exist "Voicevox" (
    rmdir "Voicevox" /s /q
)

"%ZIP_PATH%\7z.exe" x "%FILENAME_1%" -o"Voicevox\"

ren "Voicevox\windows-nvidia" "server"
move /Y "Voicevox" "C:/"

del "%FILENAME_1%" "%FILENAME_2%"

set "FILENAME_SERVER=voicevox_server.bat"
set "DOWNLOAD_URL_SERVER=https://github.com/suzuuuuu09/unity-auto-build-voicevox-server/releases/download/0.2.0/%FILENAME_SERVER%"

if not exist %FILENAME_SERVER% (
    curl -L -o "%FILENAME_SERVER%" "%DOWNLOAD_URL_SERVER%"
)

copy /Y "%FILENAME_SERVER%" "C:/Voicevox/"
echo セットアップが完了しました。

endlocal
pause
