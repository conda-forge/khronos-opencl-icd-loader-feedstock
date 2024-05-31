@echo off

set "OCL_ICD_FILENAMES_CONDA_BACKUP=%OCL_ICD_FILENAMES%"

start /wait /b cmd.exe /c "%CONDA_PREFIX%\Library\etc\OpenCL\vendors\opencl-helper.bat"

set /p OCL_ICD_FILENAMES_NEW=<%CONDA_PREFIX%\Library\etc\OpenCL\vendors\temp.txt
set "OCL_ICD_FILENAMES=%OCL_ICD_FILENAMES%%OCL_ICD_FILENAMES_NEW%"
del %CONDA_PREFIX%\Library\etc\OpenCL\vendors\temp.txt
set OCL_ICD_FILENAMES_NEW=
