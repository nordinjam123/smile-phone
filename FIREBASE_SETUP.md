# Configuración Firebase para TallerPro

Este documento explica cómo configurar Firebase como backend para TallerPro, incluyendo autenticación Google y base de datos Firestore.

## 🔥 ¿Qué es Firebase?

Firebase es una plataforma de desarrollo de aplicaciones de Google que incluye:
- **Autenticación**: Manejo seguro de usuarios con Google, email, etc.
- **Firestore**: Base de datos NoSQL en tiempo real
- **Hosting**: Alojamiento gratuito para aplicaciones web
- **Analytics**: Seguimiento de uso y métricas

## 📋 Prerrequisitos

- Cuenta de Google
- Acceso a [Firebase Console](https://console.firebase.google.com)
- Permisos para crear proyectos en Google Cloud

## 🚀 Configuración Paso a Paso

### 1. Crear Proyecto Firebase

1. Ve a [Firebase Console](https://console.firebase.google.com)
2. Haz clic en **"Crear un proyecto"**
3. Introduce el nombre: `tallerpro-[tu-nombre]`
4. Habilita Google Analytics (opcional)
5. Selecciona tu región (España/Europa)
6. Crea el proyecto

### 2. Configurar Autenticación

1. En el panel de Firebase, ve a **"Authentication"**
2. Haz clic en **"Comenzar"**
3. Ve a la pestaña **"Sign-in method"**
4. Habilita los siguientes proveedores:
   - ✅ **Email/Contraseña**
   - ✅ **Google**

#### Configurar Google OAuth
1. Haz clic en **Google** en la lista de proveedores
2. Activa el toggle **"Habilitar"**
3. Selecciona tu email de proyecto como **"Dirección de email de asistencia"**
4. Guarda la configuración

### 3. Configurar Firestore Database

1. En el panel de Firebase, ve a **"Firestore Database"**
2. Haz clic en **"Crear base de datos"**
3. Selecciona **"Comenzar en modo de prueba"** (temporal)
4. Elige una ubicación cercana: **europe-west1 (Bélgica)**
5. Crea la base de datos

#### Configurar Reglas de Seguridad
Reemplaza las reglas por defecto con:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Permitir acceso a documentos del usuario autenticado
    match /{document=**} {
      allow read, write: if request.auth != null && 
        resource.data.userId == request.auth.uid;
    }
    
    // Permitir escritura de perfiles de usuario
    match /users/{userId} {
      allow read, write: if request.auth != null && 
        request.auth.uid == userId;
    }
  }
}
```

### 4. Configurar Aplicación Web

1. En el panel principal, haz clic en **"Agregar aplicación"**
2. Selecciona el ícono **Web** (`</>`)
3. Introduce el nombre: `TallerPro Web`
4. **NO** marques "Configurar Firebase Hosting" (por ahora)
5. Haz clic en **"Registrar aplicación"**

### 5. Obtener Configuración

Firebase te mostrará un código similar a este:

```javascript
const firebaseConfig = {
  apiKey: "AIzaSyAbc123...",
  authDomain: "tallerpro-tu-nombre.firebaseapp.com",
  projectId: "tallerpro-tu-nombre",
  storageBucket: "tallerpro-tu-nombre.appspot.com",
  messagingSenderId: "123456789012",
  appId: "1:123456789012:web:abc123def456"
};
```

## 🔧 Configurar en TallerPro

### 1. Acceder a Configuración de Almacenamiento

1. Inicia sesión en TallerPro
2. Ve al menú lateral **"Almacenamiento"**
3. Selecciona **"Firebase (Google)"**

### 2. Introducir Configuración

1. Copia la configuración completa de Firebase
2. Pégala en el campo **"Configuración Firebase (JSON)"**
3. Haz clic en **"Probar Conexión"**
4. Si es exitoso, haz clic en **"Guardar Configuración"**

### 3. Migrar Datos (Opcional)

Si ya tienes datos en TallerPro:
1. Haz clic en **"Migrar Datos Existentes"**
2. Espera a que se complete la migración
3. Verifica que todos los datos se transfirieron correctamente

## 🎯 Ventajas de Firebase

### Para el Usuario
- **Autenticación Google**: Login con un clic
- **Sincronización en tiempo real**: Cambios instantáneos entre dispositivos
- **Acceso offline**: Funciona sin conexión y sincroniza después
- **Seguridad**: Respaldado por la infraestructura de Google

### Para el Negocio
- **Escalabilidad automática**: Se adapta al crecimiento
- **Pago por uso**: Solo pagas por lo que usas
- **Infraestructura propia**: Tus datos en tu proyecto
- **Integración Google Workspace**: Compatible con Gmail, Drive, etc.

## 💰 Costos Estimados

Firebase tiene un plan gratuito generoso:

### Plan Gratuito (Spark)
- **Firestore**: 50,000 lecturas/día
- **Authentication**: Usuarios ilimitados
- **Storage**: 1 GB

### Plan de Pago (Blaze)
- **Firestore**: €0.054 por 100,000 lecturas
- **Authentication**: Gratuito
- **Storage**: €0.026 por GB/mes

**Estimación para taller pequeño**: €0-5/mes
**Estimación para taller mediano**: €5-20/mes

## 🛡️ Seguridad

### Reglas de Firestore
Las reglas configuradas aseguran que:
- Solo usuarios autenticados pueden acceder
- Cada usuario solo ve sus propios datos
- Los datos están protegidos contra acceso no autorizado

### Autenticación
- Tokens JWT seguros
- Renovación automática de sesiones
- Logout automático en caso de inactividad

## 🔄 Migración y Backup

### Backup Automático
Firebase incluye backup automático de datos.

### Exportar Datos
Puedes exportar todos tus datos desde la consola de Firebase.

### Migrar de Supabase
TallerPro incluye herramientas automáticas para migrar desde Supabase a Firebase.

## ❓ Solución de Problemas

### Error de Configuración
- Verifica que el JSON esté bien formateado
- Asegúrate de que todas las comillas sean dobles (`"`)
- Revisa que no falte ninguna coma

### Error de Autenticación
- Verifica que Email/Password esté habilitado
- Confirma que Google OAuth esté configurado
- Revisa las reglas de Firestore

### Error de Permisos
- Asegúrate de ser propietario del proyecto Firebase
- Verifica que las reglas de Firestore estén configuradas
- Confirma que el usuario esté autenticado

## 📞 Soporte

Si tienes problemas con la configuración:
1. Revisa este documento paso a paso
2. Consulta la [documentación de Firebase](https://firebase.google.com/docs)
3. Contacta al soporte de TallerPro: mitaller@mitallerenlinea.org

---

## 🚀 ¡Siguiente Paso!

Una vez configurado Firebase, puedes:
1. Invitar a tu equipo como usuarios
2. Configurar reglas avanzadas de Firestore
3. Explorar Firebase Analytics para métricas del negocio
4. Considerar Firebase Hosting para tu página web

¡Disfruta de la potencia de Google Cloud en tu taller! 🔥
