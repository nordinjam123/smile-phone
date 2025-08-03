#!/bin/bash

echo "🚀 Iniciando sistema WhatsApp Web completo..."

# Verificar si Node.js está instalado
if ! command -v node &> /dev/null; then
    echo "❌ Node.js no está instalado. Por favor instálalo primero."
    exit 1
fi

# Verificar si npm está instalado
if ! command -v npm &> /dev/null; then
    echo "❌ npm no está instalado. Por favor instálalo primero."
    exit 1
fi

echo "📦 Instalando dependencias del servidor WhatsApp..."
cd server
if [ ! -d "node_modules" ]; then
    npm install
fi

echo "🔄 Iniciando servidor WhatsApp Web en puerto 3001..."
npm start &
SERVER_PID=$!

# Esperar a que el servidor se inicie
sleep 3

echo "🌐 Iniciando frontend en puerto 8080..."
cd ..
npm run dev &
FRONTEND_PID=$!

echo ""
echo "✅ Sistema iniciado correctamente!"
echo ""
echo "📱 Frontend: http://localhost:8080"
echo "🔧 Servidor WhatsApp: http://localhost:3001"
echo "🩺 Health check: http://localhost:3001/health"
echo ""
echo "📋 Para configurar WhatsApp Web:"
echo "1. Ve a http://localhost:8080"
echo "2. Navega a 'Configuración de WhatsApp'"
echo "3. Activa WhatsApp Web y conecta tu cuenta"
echo ""
echo "⚠️  Para detener los servicios, presiona Ctrl+C"

# Función para limpiar procesos al salir
cleanup() {
    echo ""
    echo "🛑 Deteniendo servicios..."
    kill $SERVER_PID 2>/dev/null
    kill $FRONTEND_PID 2>/dev/null
    echo "✅ Servicios detenidos"
    exit 0
}

# Capturar Ctrl+C
trap cleanup SIGINT

# Mantener el script ejecutándose
wait
