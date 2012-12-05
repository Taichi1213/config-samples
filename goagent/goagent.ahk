PROXY_EXE_FULL_PATH=C:\Tools\goagent\goagent.exe
PROXY_CONF_FILE=proxy.ini

;SplitPath, InputVar [, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive]
SplitPath, PROXY_EXE_FULL_PATH, PROXY_EXE_FILE, PROXY_PATH
;>>PROXY_EXE_FILE=goagent.exe
;>>PROXY_PATH=C:\Tools\goagent
;>>ROOT_DRIVE=C:

;FileCopy, SourcePattern, DestPattern [, Flag]
FileCopy, %A_ScriptDir%/%PROXY_CONF_FILE%, %PROXY_PATH%/proxy.ini, 1

if (ErrorLevel <> 0)
{
    MsgBox %ErrorLevel% could not be copied.
    return
}
