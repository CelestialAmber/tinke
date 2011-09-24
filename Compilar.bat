:inicio
ECHO off
CLS

CHOICE /C RD /M "Elija la configuraci�n: presione R para Release o D para Debug."
IF errorlevel 1 set conf=Release
IF errorlevel 2 set conf=Debug

CHOICE /C 123 /M "Elija la plataforma: presione 1 para x86, 2 para x64 o 3 para Any CPU."
IF errorlevel 1 set plat=x86
IF errorlevel 2 set plat=x64
IF errorlevel 3 set plat=Any CPU

CHOICE /C SN /M "Ha elejido la configuraci�n  %conf% y la plataforma %plat%, �es correcto?"
IF errorlevel 2 goto inicio

RMDIR /S /Q "%cd%\build"

REM Compilaci�n normal del programa que los plugin puedan encontrar la DLL (pluginInterface)
%windir%\microsoft.net\framework\v4.0.30319\msbuild Tinke.sln /v:minimal /p:Configuration=%conf%;TarjetFrameworkVersion=v3.5 "/p:Platform=%plat%"
REM Compilaci�n del programa
%windir%\microsoft.net\framework\v4.0.30319\msbuild Tinke.sln /v:minimal /p:Configuration=%conf%;TarjetFrameworkVersion=v3.5 "/p:Platform=%plat%" "/p:OutputPath=%CD%\build\"

REM Compilaci�n de plugins de los juegos
%windir%\microsoft.net\framework\v4.0.30319\msbuild Plugins\LAYTON\LAYTON.sln /v:minimal /p:Configuration=%conf%;TarjetFrameworkVersion=v3.5 "/p:Platform=Any CPU" "/p:OutputPath=%CD%\build\Plugins\"
%windir%\microsoft.net\framework\v4.0.30319\msbuild "Plugins\KIRBY DRO\KIRBY DRO.sln" /v:minimal /p:Configuration=%conf%;TarjetFrameworkVersion=v3.5 "/p:Platform=Any CPU" "/p:OutputPath=%CD%\build\Plugins\"
%windir%\microsoft.net\framework\v4.0.30319\msbuild "Plugins\AI IGO DS\AI IGO DS.sln" /v:minimal /p:Configuration=%conf%;TarjetFrameworkVersion=v3.5 "/p:Platform=Any CPU" "/p:OutputPath=%CD%\build\Plugins\"
%windir%\microsoft.net\framework\v4.0.30319\msbuild Plugins\LASTWINDOW\LASTWINDOW.sln /v:minimal /p:Configuration=%conf%;TarjetFrameworkVersion=v3.5 "/p:Platform=Any CPU" "/p:OutputPath=%CD%\build\Plugins\"
%windir%\microsoft.net\framework\v4.0.30319\msbuild "Plugins\TETRIS DS\TETRIS DS.sln" /v:minimal /p:Configuration=%conf%;TarjetFrameworkVersion=v3.5 "/p:Platform=Any CPU" "/p:OutputPath=%CD%\build\Plugins\"
%windir%\microsoft.net\framework\v4.0.30319\msbuild "Plugins\999HRPERDOOR\999HRPERDOOR.sln" /v:minimal /p:Configuration=%conf%;TarjetFrameworkVersion=v3.5 "/p:Platform=Any CPU" "/p:OutputPath=%CD%\build\Plugins\"
%windir%\microsoft.net\framework\v4.0.30319\msbuild "Plugins\EDGEWORTH\EDGEWORTH.sln" /v:minimal /p:Configuration=%conf%;TarjetFrameworkVersion=v3.5 "/p:Platform=Any CPU" "/p:OutputPath=%CD%\build\Plugins\"

REM Compilaci�n de los plugins de formatos
%windir%\microsoft.net\framework\v4.0.30319\msbuild Plugins\NARC\NARC.sln /v:minimal /p:Configuration=%conf%;TarjetFrameworkVersion=v3.5 "/p:Platform=Any CPU" "/p:OutputPath=%CD%\build\Plugins\"
%windir%\microsoft.net\framework\v4.0.30319\msbuild Plugins\TXT\TXT.sln /v:minimal /p:Configuration=%conf%;TarjetFrameworkVersion=v3.5 "/p:Platform=Any CPU" "/p:OutputPath=%CD%\build\Plugins\"
%windir%\microsoft.net\framework\v4.0.30319\msbuild Plugins\Common\Common.sln /v:minimal /p:Configuration=%conf%;TarjetFrameworkVersion=v3.5 "/p:Platform=Any CPU" "/p:OutputPath=%CD%\build\Plugins\"
%windir%\microsoft.net\framework\v4.0.30319\msbuild Plugins\Images\Images.sln /v:minimal /p:Configuration=%conf%;TarjetFrameworkVersion=v3.5 "/p:Platform=Any CPU" "/p:OutputPath=%CD%\build\Plugins\"
%windir%\microsoft.net\framework\v4.0.30319\msbuild Plugins\SDAT\SDAT.sln /v:minimal /p:Configuration=%conf%;TarjetFrameworkVersion=v3.5 "/p:Platform=Any CPU" "/p:OutputPath=%CD%\build\Plugins\"
%windir%\microsoft.net\framework\v4.0.30319\msbuild Plugins\Sounds\Sounds.sln /v:minimal /p:Configuration=%conf%;TarjetFrameworkVersion=v3.5 "/p:Platform=Any CPU" "/p:OutputPath=%CD%\build\Plugins\"
%windir%\microsoft.net\framework\v4.0.30319\msbuild Plugins\Fonts\Fonts.sln /v:minimal /p:Configuration=%conf%;TarjetFrameworkVersion=v3.5 "/p:Platform=Any CPU" "/p:OutputPath=%CD%\build\Plugins\"
%windir%\microsoft.net\framework\v4.0.30319\msbuild Plugins\3DModels\3DModels.sln /v:minimal /p:Configuration=%conf%;TarjetFrameworkVersion=v3.5 "/p:Platform=Any CPU" "/p:OutputPath=%CD%\build\Plugins\"

COPY "%cd%\changelog.txt" "%cd%\build\"
COPY "%cd%\Licence.txt" "%cd%\build\"

PAUSE