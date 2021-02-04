::
:: Deploys project and sources of the opengl-util library to a given
:: directory. Will create a subdirectory for the library.
:: Example: > .\deploy_as_sources.bat C:\libs
::
@echo off
setlocal

set outDir=%1
set thisDir=%~dp0

set src=%thisDir%..\..
set dest=%outDir%\opengl_util

:: Deploy code.
mkdir %dest%
robocopy %src% %dest% *.h
robocopy %src% %dest% *.cpp

:: Deploy project.
set from=%src%\project\vs
set to=%dest%\project\vs
mkdir %to%
robocopy %from% %to% opengl_util.vcxproj
robocopy %from% %to% opengl_util.vcxproj.filters
robocopy %from% %to% deploy_as_sources.bat
