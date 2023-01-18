@echo off

cd ..\src
dotnet publish -c Release -r win10-x64 --self-contained --nologo -o publish/windows -p:PublishSingleFile=true -p:IncludeNativeLibrariesForSelfExtract=true