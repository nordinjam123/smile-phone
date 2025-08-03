# 🚀 Setup WhatsApp Web Automation

## ¿Qué es esto?

Un sistema **100% GRATUITO** para enviar mensajes automáticos de WhatsApp usando WhatsApp Web. No necesitas pagar ninguna API, solo usa tu cuenta normal de WhatsApp.

## 📋 Instalación

### 1. Instalar dependencias del servidor

```bash
cd server
npm install
```

### 2. Iniciar el servidor WhatsApp

```bash
npm start
```

O para desarrollo con auto-recarga:
```bash
npm run dev
```

El servidor se ejecutará en `http://localhost:3001`

## 🔧 Configuración

### 1. Abrir la aplicación
- Ve a la página de "Configuración de WhatsApp" en tu aplicación
- Activa el switch "Activar WhatsApp Web"

### 2. Conectar WhatsApp
- Haz clic en "Conectar WhatsApp"
- Se mostrará un código QR en pantalla
- Abre WhatsApp en tu teléfono
- Ve a **Configuración > Dispositivos vinculados**
- Toca **"Vincular un dispositivo"**
- Escanea el código QR

### 3. ¡Listo!
Una vez conectado, los mensajes se enviarán automáticamente cuando:
- Se reciba una nueva orden
- Se complete una reparación
- Se genere una factura
- Se necesite enviar un recordatorio

## 📱 Cómo funciona

1. **Conexión inicial**: Escaneas el QR una sola vez
2. **Sesión persistente**: Una vez conectado, funciona automáticamente
3. **Envío automático**: Los mensajes se envían según tus plantillas configuradas
4. **Sin límites**: No hay restricciones de mensajes por día
5. **Completamente gratis**: No pagas nada, usa tu WhatsApp normal

## 🛠️ Características

- ✅ **100% Gratuito** - Sin costos de API
- ✅ **Fácil configuración** - Solo escanear QR una vez
- ✅ **Mensajes automáticos** - Se envían solos
- ✅ **Plantillas personalizables** - Edita los mensajes
- ✅ **Variables dinámicas** - Nombres, números, fechas automáticas
- ✅ **Sin límites** - Envía todos los mensajes que necesites
- ✅ **Sesión persistente** - No necesitas reconectar constantemente

## 🔍 Solución de problemas

### El código QR no aparece
1. Verifica que el servidor esté ejecutándose en puerto 3001
2. Revisa la consola del servidor para errores
3. Reinicia el servidor: `npm start`

### WhatsApp se desconecta
1. Ve a la configuración de WhatsApp Web
2. Haz clic en "Conectar WhatsApp" nuevamente
3. Escanea el nuevo código QR

### Los mensajes no se envían
1. Verifica que WhatsApp Web esté conectado (badge verde)
2. Comprueba que las plantillas estén activadas
3. Revisa la consola del navegador para errores

### Error: "Failed to fetch"
Si el servidor no está disponible, los mensajes se abrirán automáticamente en WhatsApp Web para envío manual.

## 📂 Estructura de archivos

```
server/
├── package.json          # Dependencias del servidor
├── whatsapp-server.js     # Servidor principal
└── .wwebjs_auth/         # Sesión de WhatsApp (se crea automáticamente)

src/
├── components/
│   └── WhatsAppConfig.tsx # Interfaz de configuración
└── lib/
    └── whatsappUtils.ts   # Utilidades de mensajería
```

## 🚨 Importante

- **Mantén el servidor ejecutándose** para envío automático
- **No cierres WhatsApp Web** en el navegador del servidor
- **Respeta los términos de WhatsApp** - No envíes spam
- **Usa responsablemente** - Solo para comunicación legítima con clientes

## 💡 Consejos

1. **Ejecutar 24/7**: Para máxima automatización, mantén el servidor ejecutándose siempre
2. **Backup de sesión**: La carpeta `.wwebjs_auth` contiene tu sesión, haz backup
3. **Monitoreo**: Revisa los logs del servidor periódicamente
4. **Plantillas efectivas**: Personaliza los mensajes para tu negocio

## 🆘 Soporte

Si tienes problemas:
1. Revisa los logs del servidor
2. Verifica que WhatsApp Web funcione manualmente
3. Reinicia el servidor y reconecta
4. Comprueba que el puerto 3001 esté disponible
