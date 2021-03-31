set "OCL_ICD_FILENAMES_CONDA_BACKUP=%OCL_ICD_FILENAMES%"

for %%f in (%PREFIX%\Library\etc\OpenCL\vendors\*.icd) do (
  set /p dllname=< %%~f
  set "OCL_ICD_FILENAMES=%OCL_ICD_FILENAMES%;%dllname%"
)
