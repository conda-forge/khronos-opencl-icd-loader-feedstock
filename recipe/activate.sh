export OCL_ICD_FILENAMES_CONDA_BACKUP=$OCL_ICD_FILENAMES
for f in $(echo ${CONDA_PREFIX}| sed 's#\\#/#g')/Library/etc/OpenCL/vendors/*.icd; do
  [ -f "$f" ] || continue
  dllname=$(cat $f)
  export OCL_ICD_FILENAMES="$dllname;${OCL_ICD_FILENAMES:-}"
done
