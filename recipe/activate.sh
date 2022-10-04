export OCL_ICD_FILENAMES_CONDA_BACKUP=$OCL_ICD_FILENAMES
for f in $CONDA_PREFIX/Library/etc/OpenCL/vendors/*.icd; do
  dllname=$(cat $f)
  export OCL_ICD_FILENAMES=$dllname;${OCL_ICD_FILENAMES:-}
done
