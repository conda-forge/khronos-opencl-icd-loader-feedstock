if [[ "${variant}" != "system-only" ]]
  sed -i.bak  "s|/etc/OpenCL/vendors|$PREFIX/etc/OpenCL/vendors|g" loader/icd_platform.h;
fi

mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_BUILD_TYPE=Release ..
make -j${CPU_COUNT}
make install

mkdir -p $PREFIX/include/CL
cp $SRC_DIR/inc/CL/* $PREFIX/include/CL/

if [[ "${target_platform}" == osx* ]]; then
    ln -s $PREFIX/include/CL $PREFIX/include/OpenCL
fi
