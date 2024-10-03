@echo off

@REM set "ZIP_PATH=C:\Program Files\7-Zip\7z.exe"

REM 7-Zipがインストールされているか確認
@REM if not exist "%ZIP_PATH%" (
@REM     :RESTART
@REM     set /p yn_check="7-Zipがインストールされていません。インストールしますか？ (y/n) "
    
@REM     REM 入力の小文字化で判定を簡素化
@REM     if /i "%yn_check%"=="y" (
@REM         set "ZIP_URL=https://www.7-zip.org/a/7z1900-x64.exe"
@REM         set "ZIP_INSTALLER=7z_installer.exe"
@REM         curl -L -o "%TEMP%\%ZIP_INSTALLER%" "%ZIP_URL%"
@REM         start /wait "" "%TEMP%\%ZIP_INSTALLER%" /S
@REM     ) else if /i "%yn_check%"=="n" (
@REM         echo 7-Zipがインストールされていないため、実行を終了します。
@REM         pause
@REM         exit /b
@REM     ) else (
@REM         echo 無効な入力です。もう一度入力してください。
@REM         goto RESTART
@REM     )
@REM )

set "FILENAME_1=voicevox_engine-windows-nvidia-0.19.1.7z.001"
set "DOWNLOAD_URL_1=https://github.com/VOICEVOX/voicevox_engine/releases/download/0.19.1/%FILENAME_1%"

@REM パッケージ1ダウンロード
curl -L -o "%FILENAME_1%" "%DOWNLOAD_URL_1%"

@REM パッケージ2のダウンロードはコメントアウト中
set "FILENAME_2=voicevox_engine-windows-nvidia-0.19.1.7z.002"
set "DOWNLOAD_URL_2=https://github.com/VOICEVOX/voicevox_engine/releases/download/0.19.1/%FILENAME_2%"
curl -L -o "%FILENAME_2%" "%DOWNLOAD_URL_2%"

@REM ファイルの解凍
"C:\Program Files\7-Zip\7z.exe" x "%FILENAME_1%" -o"Voicevox\"

@REM ファイルの移動
ren "Voicevox\windows-nvidia" "server"
move /Y "Voicevox" "C:/"

@REM パッケージファイルの削除
del "%FILENAME_1%" "%FILENAME_2%"

REM 起動用のBATファイルをダウンロード
set "FILENAME_SERVER=voicevox_server.bat"
set "DOWNLOAD_URL_SERVER=https://github.com/suzuuuuu09/unity-auto-build-voicevox-server/releases/download/0.1.0/%FILENAME_SERVER%"
curl -L -o "%FILENAME_SERVER%" "%DOWNLOAD_URL_SERVER%"

REM ファイルの移動
move /Y "%FILENAME_SERVER%" "C:/Voicevox/"
echo セットアップが完了しました。
pause
