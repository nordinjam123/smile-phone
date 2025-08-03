# Configuración de Google OAuth y Google Drive

Este documento explica cómo configurar la autenticación con Google y el acceso a Google Drive para TallerPro.

## 1. Crear un proyecto en Google Cloud Platform

1. Ve a [Google Cloud Console](https://console.cloud.google.com/)
2. Crea un nuevo proyecto o selecciona uno existente
3. Habilita las APIs necesarias:
   - Google Drive API
   - Google+ API (para autenticación)

## 2. Configurar OAuth 2.0

1. Ve a "APIs y servicios" > "Credenciales"
2. Crea credenciales OAuth 2.0:
   - Tipo: "Aplicación web"
   - Nombre: "TallerPro"
   - URIs de origen autorizados:
     ```
     http://localhost:5173
     https://tu-dominio.com
     ```
   - URIs de redirección autorizados:
     ```
     https://cbxhmqhqgrxewuiysuxd.supabase.co/auth/v1/callback
     ```

3. Anota el `Client ID` y `Client Secret`

## 3. Configurar Supabase

1. Ve a tu proyecto en [Supabase Dashboard](https://supabase.com/dashboard)
2. Navega a "Authentication" > "Providers"
3. Busca "Google" y habilítalo
4. Completa la configuración:
   - **Client ID**: El Client ID de Google
   - **Client Secret**: El Client Secret de Google
   - **Scopes**: `openid email profile https://www.googleapis.com/auth/drive.file`

## 4. Configurar el dominio de redirección

En la configuración de Google OAuth en Supabase, asegúrate de que la URL de redirección esté configurada correctamente:

```
https://TU_PROYECTO_SUPABASE.supabase.co/auth/v1/callback
```

## 5. Funcionalidades implementadas

### Autenticación con Google
- Inicio de sesión con Google OAuth
- Acceso a Google Drive con permisos limitados
- Manejo de tokens de acceso

### Backup en Google Drive
- Creación automática de copias de seguridad
- Almacenamiento en la carpeta `appDataFolder` (privada de la app)
- Lista de backups disponibles
- Restauración de datos desde backup
- Formato JSON con todos los datos del usuario

### Estructura del backup
```json
{
  "talleres": [...],
  "inventario": [...],
  "mercancia": [...],
  "gastos": [...],
  "clientes": [...],
  "presupuestos": [...],
  "createdAt": "2024-01-15T10:30:00.000Z",
  "userId": "uuid-del-usuario"
}
```

## 6. Seguridad

- Los backups se almacenan en `appDataFolder`, que es privado de la aplicación
- Solo el usuario propietario puede acceder a sus backups
- Los tokens de Google tienen permisos limitados (`drive.file`)
- Validación de propiedad antes de restaurar backups

## 7. Uso en la aplicación

### Componentes principales:
- `GoogleDriveBackup`: Interfaz principal para gestionar backups
- `GoogleDriveService`: Servicio para interactuar con Google Drive API
- `useGoogleAuth`: Hook para gestionar la autenticación con Google

### Funciones disponibles:
- Conectar/desconectar Google Drive
- Crear backup manual
- Listar backups disponibles
- Restaurar desde backup
- Verificación automática de conexión

## 8. Permisos de Google Drive

La aplicación solicita el scope `https://www.googleapis.com/auth/drive.file` que permite:
- Crear archivos en Google Drive
- Acceder solo a archivos creados por la aplicación
- Modificar archivos creados por la aplicación
- **NO** permite acceder a otros archivos del usuario

## 9. Troubleshooting

### Error: "OAuth not configured"
- Verifica que Google OAuth esté habilitado en Supabase
- Confirma que el Client ID y Secret sean correctos

### Error: "Redirect URI mismatch"
- Verifica que las URIs de redirección en Google Cloud coincidan con Supabase

### Error: "Access denied"
- El usuario puede haber denegado permisos
- Verifica que los scopes sean correctos

### Error: "Invalid token"
- El token de acceso puede haber expirado
- Implementa refresh token si es necesario

## 10. Testing

Para probar la integración:

1. Usar el componente `GoogleDriveTest` para verificar la conexión
2. Intentar crear un backup de prueba
3. Verificar que el archivo aparezca en Google Drive (carpeta de app)
4. Probar la restauración con datos de prueba

## Notas importantes

- **Producción**: Asegúrate de configurar dominios reales en lugar de localhost
- **Seguridad**: Nunca expongas Client Secrets en el frontend
- **Rate Limits**: Google Drive API tiene límites de uso, considera implementar retry logic
- **Offline**: Los backups requieren conexión a internet
