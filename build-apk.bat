@echo off
echo 🚀 Construyendo APK de Gestión de Taller...

:: Verificar que Node.js esté instalado
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Error: Node.js no está instalado
    echo Descarga e instala Node.js desde: https://nodejs.org/
    pause
    exit /b 1
)

:: Verificar que npm esté instalado
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Error: npm no está instalado
    pause
    exit /b 1
)

:: Instalar dependencias si no existen
if not exist "node_modules" (
    echo 📦 Instalando dependencias...
    npm install
    if %errorlevel% neq 0 (
        echo ❌ Error: Falló la instalación de dependencias
        pause
        exit /b 1
    )
)

:: Construir la aplicación web
echo 🔨 Construyendo aplicación web...
npm run build
if %errorlevel% neq 0 (
    echo ❌ Error: Falló la construcción de la aplicación web
    pause
    exit /b 1
)

:: Sincronizar con Capacitor
echo 🔄 Sincronizando con Capacitor...
npx cap sync
if %errorlevel% neq 0 (
    echo ❌ Error: Falló la sincronización con Capacitor
    pause
    exit /b 1
)

:: Construir APK
echo 📱 Construyendo APK...
npx cap build android
if %errorlevel% equ 0 (
    echo ✅ ¡APK construida exitosamente!
    echo 📍 La APK se encuentra en: android\app\build\outputs\apk\
    echo.
    echo Para instalar en dispositivo:
    echo 1. Habilita 'Fuentes desconocidas' en tu Android
    echo 2. Transfiere la APK a tu dispositivo
    echo 3. Toca el archivo APK para instalar
) else (
    echo ❌ Error: Falló la construcción de la APK
)

pause
