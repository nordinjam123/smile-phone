# 🚀 CREAR APK - GUÍA RÁPIDA

## ⚡ Construcción Rápida (5 pasos)

### 1. **Instalar Android Studio**
- Descarga desde: https://developer.android.com/studio
- Instala y configura el Android SDK

### 2. **Instalar dependencias**
```bash
npm install
```

### 3. **Construir aplicación web**
```bash
npm run build
```

### 4. **Sincronizar con Capacitor**
```bash
npx cap sync
```

### 5. **Construir APK**
```bash
npx cap build android
```

## 📍 **Ubicación de la APK**
```
android/app/build/outputs/apk/debug/app-debug.apk
```

## 📱 **Instalar en Android**
1. Habilita "Fuentes desconocidas" en tu dispositivo
2. Transfiere la APK a tu teléfono
3. Toca el archivo APK para instalar

## 🛠️ **Scripts Disponibles**

| Comando | Descripción |
|---------|-------------|
| `npm run android:build` | Construye la APK completa |
| `npm run android:dev` | Ejecuta en dispositivo conectado |
| `npm run build:mobile` | Solo sincroniza código web |

## ⚠️ **Solución Rápida de Problemas**

**Error: ANDROID_HOME not found**
```bash
# Windows
set ANDROID_HOME=C:\Users\%USERNAME%\AppData\Local\Android\Sdk

# macOS/Linux  
export ANDROID_HOME=$HOME/Android/Sdk
```

**Error: Gradle build failed**
- Abre Android Studio
- File > Sync Project with Gradle Files

**La app no abre**
- Verifica que el dispositivo tenga Android 7.0+ (API 24+)
- Desinstala versiones anteriores antes de instalar

## 🎯 **¡Listo!**
Tu app **"Gestión de Taller"** funcionará completamente offline en Android con todas las funcionalidades:
- TPV y ventas
- Gestión de reparaciones  
- Control de inventario
- WhatsApp integrado
- Tickets y facturas
- Balance financiero

¡La APK incluye TODO el sistema de gestión de taller! 📱✨
