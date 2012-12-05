PROXY_EXE_FULL_PATH=C:\Tools\wallproxy\WallProxy.exe
PROXY_CONF_FILE=proxy.ini
PROXY_GUI_FILE=gui.ini

;SplitPath, InputVar [, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive]
SplitPath, PROXY_EXE_FULL_PATH, PROXY_EXE_FILE, PROXY_PATH
;>>PROXY_EXE_FILE=WallProxy.exe
;>>PROXY_PATH=C:\Tools\wallproxy
;>>ROOT_DRIVE=C:

;FileCopy, SourcePattern, DestPattern [, Flag]
FileCopy, %A_ScriptDir%/%PROXY_CONF_FILE%, %PROXY_PATH%\proxy.ini, 1
FileCopy, %A_ScriptDir%/%PROXY_GUI_FILE%, %PROXY_PATH%\gui.ini, 1

if (ErrorLevel <> 0)
{
    MsgBox %ErrorLevel% could not be copied.
    return
}
