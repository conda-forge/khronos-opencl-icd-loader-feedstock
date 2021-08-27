@echo off
setlocal enabledelayedexpansion

set OCL_ICD_FILENAMES_NEW=
for %%f in (%CONDA_PREFIX%\Library\etc\OpenCL\vendors\*.icd) do (
  set /p dllname=< %%~f
  set "OCL_ICD_FILENAMES_NEW=!OCL_ICD_FILENAMES_NEW!;!dllname!"
)
if NOT "%OCL_ICD_FILENAMES_NEW%" == "" (
  echo %OCL_ICD_FILENAMES_NEW%>%CONDA_PREFIX%\Library\etc\OpenCL\vendors\temp.txt
) else (
  type NUL > %CONDA_PREFIX%\Library\etc\OpenCL\vendors\temp.txt
)
