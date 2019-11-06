mkdir build
cd build

cmake -G "%CMAKE_GENERATOR%" ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX:PATH=%LIBRARY_PREFIX% ^
    %SRC_DIR%

if errorlevel 1 exit 1

REM Build step
cmake --build . --config "%BUILD_CONFIG%"
if errorlevel 1 exit 1

REM Install step
cmake --build . --config "%BUILD_CONFIG%" --target install
if errorlevel 1 exit 1

mkdir %LIBRARY_INC%\CL
XCOPY %SRC_DIR%\inc\CL\* %LIBRARY_INC%\CL /s /i /y
if errorlevel 1 exit 1
