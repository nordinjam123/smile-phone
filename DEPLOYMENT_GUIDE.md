# 🚀 Guía de Despliegue - TallerPro Premium

## 📋 Requisitos Previos

1. **Cuenta de Supabase** (Sistema de Pagos)
2. **Cuenta de Stripe** (Procesamiento de Pagos)
3. **Dominio personalizado**
4. **Servicio de hosting** (Netlify, Vercel, o similar)

## 🔧 Configuración Paso a Paso

### 1. Configuración de Supabase

1. Crea un proyecto en [Supabase](https://supabase.com)
2. Ve a **Settings > API** y copia:
   - `Project URL`
   - `anon public key`
3. Ve a **Edge Functions** y despliega las funciones:
   ```bash
   supabase functions deploy create-checkout
   supabase functions deploy check-subscription
   supabase functions deploy customer-portal
   ```

### 2. Configuración de Stripe

1. Crea una cuenta en [Stripe](https://stripe.com)
2. Activa el modo **Live** (no Test)
3. Copia las claves:
   - `Publishable key` (pk_live_...)
   - `Secret key` (sk_live_...)
4. Configura webhooks en Stripe:
   - URL: `https://tudominio.supabase.co/functions/v1/webhook`
   - Eventos: `customer.subscription.created`, `customer.subscription.updated`, `customer.subscription.deleted`

### 3. Variables de Entorno

Copia `.env.production` a `.env` y configura:

```env
# Tu dominio personalizado
VITE_APP_URL=https://tudominio.com

# Supabase
VITE_SUPABASE_URL=https://tu-proyecto.supabase.co
VITE_SUPABASE_ANON_KEY=tu_clave_publica

# Stripe
VITE_STRIPE_PUBLISHABLE_KEY=pk_live_tu_clave_publica
```

### 4. Despliegue en Netlify

1. Conecta tu repositorio a Netlify
2. Configura las variables de entorno en **Site settings > Environment variables**
3. El archivo `netlify.toml` ya está configurado
4. Despliega automáticamente

### 5. Despliegue en Vercel

1. Conecta tu repositorio a Vercel
2. Configura las variables de entorno en **Project Settings > Environment Variables**
3. El archivo `vercel.json` ya está configurado
4. Despliega automáticamente

### 6. Configuración de Dominio Personalizado

#### En Netlify:
1. Ve a **Domain settings**
2. Añade tu dominio personalizado
3. Configura los DNS records que te proporcione Netlify

#### En Vercel:
1. Ve a **Domains**
2. Añade tu dominio personalizado
3. Configura los DNS records que te proporcione Vercel

## 🏦 Configuración de Pagos

### Precios Configurados:
- **Mensual**: 15€/mes (1500 céntimos)
- **Semestral**: 60€/6 meses (6000 céntimos)
- **Anual**: 100€/año (10000 céntimos)

### Webhooks de Stripe:
Configura estos eventos en tu webhook de Stripe:
- `customer.subscription.created`
- `customer.subscription.updated` 
- `customer.subscription.deleted`
- `invoice.payment_succeeded`
- `invoice.payment_failed`

## 🔒 Seguridad

La aplicación está configurada con:
- ✅ Headers de seguridad automáticos
- ✅ Protección XSS
- ✅ Política de contenido segura
- ✅ Sin acceso sin suscripción
- ✅ Validación de pagos en servidor

## 📱 Funcionalidades

### Incluidas en la Suscripción:
- ✅ Gestión completa de órdenes de trabajo
- ✅ TPV integrado
- ✅ Control de inventario
- ✅ Gestión de clientes
- ✅ Facturación automática
- ✅ Sistema de citas
- ✅ Balance financiero
- ✅ WhatsApp integrado
- ✅ Códigos QR
- ✅ Exportación de datos
- ✅ Soporte incluido

## 🌐 DNS Configuration

Para tu dominio personalizado, configura estos records:

```
Type: CNAME
Name: www
Value: [tu-sitio].netlify.app (o [tu-sitio].vercel.app)

Type: A
Name: @
Value: [IP proporcionada por tu hosting]
```

## 📞 Soporte

Email de soporte: mitaller@mitallerenlinea.org

---

## 🚨 Importante

- **NO uses claves de test en producción**
- **Configura SSL automático**
- **Haz backups regulares de Supabase**
- **Monitorea los pagos en Stripe**
- **Prueba todos los flujos antes de lanzar**
