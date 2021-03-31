@echo off
set "OCL_ICD_FILENAMES_CONDA_BACKUP=%OCL_ICD_FILENAMES%"

echo|set /P ="" > %CONDA_PREFIX%\Library\etc\OpenCL\vendors\temp.txt

for %%f in (%CONDA_PREFIX%\Library\etc\OpenCL\vendors\*.icd) do (
  set /p icddllname=<%%f
  echo|set /P =";%icddllname%" >> %CONDA_PREFIX%\Library\etc\OpenCL\vendors\temp.txt
)

set /p OCL_ICD_FILENAMES_NEW=<%CONDA_PREFIX%\Library\etc\OpenCL\vendors\temp.txt
set "OCL_ICD_FILENAMES=%OCL_ICD_FILENAMES%%OCL_ICD_FILENAMES_NEW%"
del %CONDA_PREFIX%\Library\etc\OpenCL\vendors\temp.txt

