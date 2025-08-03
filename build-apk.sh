#!/bin/bash

echo "🚀 Construyendo APK de Gestión de Taller..."

# Verificar que Node.js esté instalado
if ! command -v node &> /dev/null; then
    echo "❌ Error: Node.js no está instalado"
    exit 1
fi

# Verificar que npm esté instalado
if ! command -v npm &> /dev/null; then
    echo "❌ Error: npm no está instalado"
    exit 1
fi

# Instalar dependencias si no existen
if [ ! -d "node_modules" ]; then
    echo "📦 Instalando dependencias..."
    npm install
fi

# Construir la aplicación web
echo "🔨 Construyendo aplicación web..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Error: Falló la construcción de la aplicación web"
    exit 1
fi

# Sincronizar con Capacitor
echo "🔄 Sincronizando con Capacitor..."
npx cap sync

if [ $? -ne 0 ]; then
    echo "❌ Error: Falló la sincronización con Capacitor"
    exit 1
fi

# Construir APK
echo "📱 Construyendo APK..."
npx cap build android

if [ $? -eq 0 ]; then
    echo "✅ ¡APK construida exitosamente!"
    echo "📍 La APK se encuentra en: android/app/build/outputs/apk/"
    echo ""
    echo "Para instalar en dispositivo:"
    echo "1. Habilita 'Fuentes desconocidas' en tu Android"
    echo "2. Transfiere la APK a tu dispositivo"
    echo "3. Toca el archivo APK para instalar"
else
    echo "❌ Error: Falló la construcción de la APK"
    exit 1
fi
