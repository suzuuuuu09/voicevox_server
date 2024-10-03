@echo off

@REM set "ZIP_PATH=C:\Program Files\7-Zip\7z.exe"

REM 7-Zip���C���X�g�[������Ă��邩�m�F
@REM if not exist "%ZIP_PATH%" (
@REM     :RESTART
@REM     set /p yn_check="7-Zip���C���X�g�[������Ă��܂���B�C���X�g�[�����܂����H (y/n) "
    
@REM     REM ���͂̏��������Ŕ�����ȑf��
@REM     if /i "%yn_check%"=="y" (
@REM         set "ZIP_URL=https://www.7-zip.org/a/7z1900-x64.exe"
@REM         set "ZIP_INSTALLER=7z_installer.exe"
@REM         curl -L -o "%TEMP%\%ZIP_INSTALLER%" "%ZIP_URL%"
@REM         start /wait "" "%TEMP%\%ZIP_INSTALLER%" /S
@REM     ) else if /i "%yn_check%"=="n" (
@REM         echo 7-Zip���C���X�g�[������Ă��Ȃ����߁A���s���I�����܂��B
@REM         pause
@REM         exit /b
@REM     ) else (
@REM         echo �����ȓ��͂ł��B������x���͂��Ă��������B
@REM         goto RESTART
@REM     )
@REM )

set "FILENAME_1=voicevox_engine-windows-nvidia-0.19.1.7z.001"
set "DOWNLOAD_URL_1=https://github.com/VOICEVOX/voicevox_engine/releases/download/0.19.1/%FILENAME_1%"

@REM �p�b�P�[�W1�_�E�����[�h
curl -L -o "%FILENAME_1%" "%DOWNLOAD_URL_1%"

@REM �p�b�P�[�W2�̃_�E�����[�h�̓R�����g�A�E�g��
set "FILENAME_2=voicevox_engine-windows-nvidia-0.19.1.7z.002"
set "DOWNLOAD_URL_2=https://github.com/VOICEVOX/voicevox_engine/releases/download/0.19.1/%FILENAME_2%"
curl -L -o "%FILENAME_2%" "%DOWNLOAD_URL_2%"

@REM �t�@�C���̉�
"C:\Program Files\7-Zip\7z.exe" x "%FILENAME_1%" -o"Voicevox\"

@REM �t�@�C���̈ړ�
ren "Voicevox\windows-nvidia" "server"
move /Y "Voicevox" "C:/"

@REM �p�b�P�[�W�t�@�C���̍폜
del "%FILENAME_1%" "%FILENAME_2%"

REM �N���p��BAT�t�@�C�����_�E�����[�h
set "FILENAME_SERVER=voicevox_server.bat"
set "DOWNLOAD_URL_SERVER=https://github.com/suzuuuuu09/unity-auto-build-voicevox-server/releases/download/0.1.0/%FILENAME_SERVER%"
curl -L -o "%FILENAME_SERVER%" "%DOWNLOAD_URL_SERVER%"

REM �t�@�C���̈ړ�
move /Y "%FILENAME_SERVER%" "C:/Voicevox/"
echo �Z�b�g�A�b�v���������܂����B
pause
