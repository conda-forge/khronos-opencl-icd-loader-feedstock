setlocal EnableDelayedExpansion

mkdir build
cd build

set "BUILD_CONFIG=Release"

cmake -G "Ninja" ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX:PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE=%BUILD_CONFIG% ^
    -DUSE_DYNAMIC_VCXX_RUNTIME=ON ^
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

:: Copy the [de]activate scripts to %PREFIX%\etc\conda\[de]activate.d.
:: This will allow them to be run on environment activation.
for %%F in (activate deactivate) DO (
    if not exist %PREFIX%\etc\conda\%%F.d mkdir %PREFIX%\etc\conda\%%F.d
    copy %RECIPE_DIR%\%%F.bat %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.bat
)

mkdir %LIBRARY_PREFIX%\etc\OpenCL\vendors
copy %RECIPE_DIR%\opencl-helper.bat %LIBRARY_PREFIX%\etc\OpenCL\vendors\opencl-helper.bat
