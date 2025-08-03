# 📱 Crear APK de Gestión de Taller

## Requisitos Previos

### 1. Instalar Android Studio
- Descarga [Android Studio](https://developer.android.com/studio)
- Instálalo siguiendo las instrucciones
- Abre Android Studio y completa la configuración inicial
- Instala el Android SDK (se hace automáticamente)

### 2. Instalar Java JDK
- Instala [Java JDK 11 o superior](https://adoptium.net/)
- Verifica la instalación: `java -version`

### 3. Configurar Variables de Entorno
En **Windows**:
```bash
ANDROID_HOME = C:\Users\TuUsuario\AppData\Local\Android\Sdk
JAVA_HOME = C:\Program Files\Eclipse Adoptium\jdk-11.0.x-hotspot
```

En **macOS/Linux**:
```bash
export ANDROID_HOME=$HOME/Android/Sdk
export JAVA_HOME=/path/to/java
```

## 🚀 Construcción Rápida

### Opción 1: Script Automático (Recomendado)

**En Windows:**
```bash
build-apk.bat
```

**En macOS/Linux:**
```bash
chmod +x build-apk.sh
./build-apk.sh
```

### Opción 2: Comandos Manuales

```bash
# 1. Instalar dependencias
npm install

# 2. Construir aplicación web
npm run build

# 3. Sincronizar con Capacitor
npx cap sync

# 4. Construir APK
npx cap build android
```

## 📍 Ubicación de la APK

Después de la construcción exitosa, encontrarás la APK en:
```
android/app/build/outputs/apk/debug/app-debug.apk
```

## 📲 Instalar en tu Dispositivo Android

1. **Habilitar Fuentes Desconocidas:**
   - Ve a Configuración > Seguridad
   - Activa "Fuentes desconocidas" o "Instalar aplicaciones desconocidas"

2. **Transferir APK:**
   - Copia el archivo APK a tu dispositivo
   - Usa USB, email, Google Drive, etc.

3. **Instalar:**
   - Toca el archivo APK en tu dispositivo
   - Confirma la instalación

## 🛠️ Solución de Problemas

### Error: Command failed with exit code 1
- Verifica que Android Studio esté instalado
- Asegúrate de que las variables de entorno estén configuradas
- Ejecuta `npx cap doctor` para diagnóstico

### Error: ANDROID_HOME not found
```bash
# Windows
set ANDROID_HOME=C:\Users\TuUsuario\AppData\Local\Android\Sdk

# macOS/Linux
export ANDROID_HOME=$HOME/Android/Sdk
```

### Error: Gradle build failed
- Abre Android Studio
- Ve a File > Sync Project with Gradle Files
- Deja que se descarguen todas las dependencias

## 🎯 APK de Producción (Firmada)

Para crear una APK firmada para distribución:

1. **Generar Keystore:**
```bash
keytool -genkey -v -keystore my-upload-key.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias my-key-alias
```

2. **Configurar en capacitor.config.ts:**
```typescript
android: {
  buildOptions: {
    keystorePath: "my-upload-key.keystore",
    keystoreAlias: "my-key-alias",
    keystorePassword: "tu-password",
    keystoreAliasPassword: "tu-alias-password",
    releaseType: "apk"
  }
}
```

3. **Construir APK firmada:**
```bash
npx cap build android --prod
```

## 📋 Características de la App

La APK incluye todas las funcionalidades:
- ✅ Gestión de reparaciones
- ✅ TPV (Terminal Punto de Venta)
- ✅ Inventario de móviles
- ✅ Control de gastos
- ✅ Balance financiero
- ✅ WhatsApp integrado
- ✅ Generación de tickets y facturas
- ✅ Sistema de códigos QR
- ✅ Base de datos local (funciona sin internet)

## 🔧 Personalización

Para cambiar el nombre o icono de la app:

1. **Cambiar nombre:**
   - Edita `appName` en `capacitor.config.ts`

2. **Cambiar icono:**
   - Reemplaza los iconos en `android/app/src/main/res/`
   - Usa [Icon Generator](https://capacitorjs.com/docs/guides/splash-screens-and-icons)

## 📞 Soporte

Si tienes problemas:
1. Ejecuta `npx cap doctor` para diagnóstico
2. Revisa los logs en Android Studio
3. Verifica que todos los requisitos estén instalados

¡Tu app de Gestión de Taller estará lista para usar en Android! 🎉
