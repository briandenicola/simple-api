#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
SRC_PATH=$(realpath "${SCRIPT_DIR}/../src")

cd ${SRC_PATH}
dotnet publish -c Release -r osx.11.0-arm64 --self-contained --nologo -o publish/mac -p:PublishSingleFile=true -p:IncludeNativeLibrariesForSelfExtract=true
dotnet publish -c Release -r linux-x64 --self-contained --nologo -o publish/linux -p:PublishSingleFile=true -p:IncludeNativeLibrariesForSelfExtract=true
cd ${SCRIPT_DIR}