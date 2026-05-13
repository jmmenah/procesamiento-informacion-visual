@echo off
setlocal
SET ENV_NAME=clase_PIV
SET ENV_FILE=
SET CONDA_CMD=

:: --- BUSQUEDA DE CONDA ---
if defined CONDA_EXE (
    set "CONDA_CMD=%CONDA_EXE:"=%"
    if not exist "%CONDA_CMD%" set "CONDA_CMD="
)
if not defined CONDA_CMD if exist "%UserProfile%\anaconda3\condabin\conda.bat" set "CONDA_CMD=%UserProfile%\anaconda3\condabin\conda.bat"
if not defined CONDA_CMD if exist "%UserProfile%\miniconda3\condabin\conda.bat" set "CONDA_CMD=%UserProfile%\miniconda3\condabin\conda.bat"
if not defined CONDA_CMD if exist "C:\ProgramData\anaconda3\condabin\conda.bat" set "CONDA_CMD=C:\ProgramData\anaconda3\condabin\conda.bat"
if not defined CONDA_CMD if exist "C:\ProgramData\miniconda3\condabin\conda.bat" set "CONDA_CMD=C:\ProgramData\miniconda3\condabin\conda.bat"

if not defined CONDA_CMD (
    echo [ERROR] No se encontro Conda.
    pause
    exit /b 1
)

:: --- BUSQUEDA DEL ARCHIVO YAML ---
if exist environment.yml (
    SET ENV_FILE=environment.yml
) else if exist enviroment.yml (
    SET ENV_FILE=enviroment.yml
) else (
    echo [ERROR] No se encontro el archivo .yml
    pause
    exit /b 1
)

echo Comprobando entorno Conda: %ENV_NAME%...

:: Verificar si el entorno ya existe
call "%CONDA_CMD%" env list | findstr /C:"%ENV_NAME%" > nul

if %errorlevel% equ 0 (
    echo [OK] El entorno ya existe. Actualizando librerias...
    :: ESTA ES LA LINEA CLAVE: Actualiza si ya existe
    call "%CONDA_CMD%" env update -f "%ENV_FILE%" --prune
) else (
    echo [!] El entorno no existe. Creando desde cero...
    call "%CONDA_CMD%" env create -f "%ENV_FILE%"
)

if errorlevel 1 (
    echo [ERROR] Hubo un problema instalando las librerias.
    pause
    exit /b 1
)

:: --- REGISTRO DEL KERNEL ---
echo [INFO] Activando y registrando kernel...
:: Usamos 'call conda activate' para asegurar que el path cambie en el script
call "%CONDA_CMD%" activate %ENV_NAME%

python -m ipykernel install --user --name %ENV_NAME% --display-name "Python 3.12 (Clase PIV)"

echo ==========================================
echo CONFIGURACION COMPLETADA
echo Librerias actualizadas y kernel registrado.
echo ==========================================
pause