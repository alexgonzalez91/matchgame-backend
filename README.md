# MatchGame - Backend

Backend de MatchGame, una aplicación web Full Stack orientada al descubrimiento de videojuegos.

Este repositorio contiene la API REST propia del proyecto, desarrollada con Node.js, Express y MySQL.

La API gestiona el catálogo de videojuegos, géneros, plataformas, reseñas editoriales, etiquetas y operaciones CRUD sobre el recurso principal.

## Tecnologías utilizadas

- Node.js
- Express
- MySQL
- mysql2
- CORS
- dotenv
- pnpm

## Funcionalidades principales

- API REST propia.
- Conexión a base de datos MySQL.
- Pool de conexiones.
- CRUD completo de videojuegos.
- Búsqueda por título.
- Filtro por género.
- Filtro por plataforma.
- Ordenación.
- Paginación real.
- Validación de parámetros.
- Consultas SQL parametrizadas.
- Relaciones entre videojuegos, géneros y plataformas.
- Reseñas editoriales.
- Filtro por etiquetas.
- Middleware de API key para operaciones protegidas.
- Middleware 404.
- Manejo centralizado de errores.
- Configuración CORS.
- Variables de entorno.
- Ruta de health check.

## Estructura principal

```text
matchgame-backend/
├── database/
│   ├── schema.sql
│   └── seed.sql
├── src/
│   ├── controllers/
│   ├── data/
│   ├── middlewares/
│   ├── routes/
│   └── app.js
├── .env.example
├── .gitignore
├── package.json
└── pnpm-lock.yaml
```

## Base de datos

La aplicación utiliza una base de datos relacional con los siguientes recursos principales:

```text
generos
plataformas
juegos
juego_plataforma
resenas_editoriales
```

Relaciones principales:

```text
generos
   │
   └── juegos

juegos
   │
   ├── juego_plataforma
   │       │
   │       └── plataformas
   │
   └── resenas_editoriales
```

La tabla `juego_plataforma` permite una relación muchos a muchos entre videojuegos y plataformas.

## Datos iniciales

El proyecto incluye datos de ejemplo mediante:

```text
database/schema.sql
database/seed.sql
```

El catálogo inicial contiene:

```text
50 videojuegos
10 géneros
6 plataformas
50 reseñas editoriales
```

## Requisitos

Para ejecutar el backend localmente es necesario tener instalado:

- Node.js
- pnpm
- MySQL o MariaDB

## Instalación

Clonar el repositorio:

```bash
git clone https://github.com/alexgonzalez91/matchgame-backend.git
```

Entrar en la carpeta:

```bash
cd matchgame-backend
```

Instalar dependencias:

```bash
pnpm install
```

## Variables de entorno

Crear un archivo `.env` en la raíz del proyecto.

Ejemplo:

```env
PORT=3000

FRONTEND_URL=http://localhost:4321

DB_HOST=127.0.0.1
DB_PORT=3306
DB_NAME=matchgame_db
DB_USER=root
DB_PASSWORD=

API_KEY=your_api_key_here
```

También existe:

```text
.env.example
```

como referencia de las variables necesarias.

> El archivo `.env` contiene información privada y no debe subirse al repositorio.

## Base de datos local

Crear la base de datos ejecutando:

```text
database/schema.sql
```

Después cargar los datos iniciales:

```text
database/seed.sql
```

## Ejecutar en desarrollo

```bash
pnpm dev
```

El servidor se ejecuta normalmente en:

```text
http://localhost:3000
```

El modo desarrollo utiliza:

```text
node --watch src/app.js
```

## Ejecutar en producción

```bash
pnpm start
```

Este comando ejecuta:

```text
node src/app.js
```

El servidor utiliza:

```js
process.env.PORT || 3000
```

para permitir que el proveedor de hosting defina el puerto.

## Health check

La API dispone de una ruta de comprobación:

```http
GET /api/health
```

Respuesta esperada:

```json
{
  "ok": true,
  "message": "MatchGame API funcionando"
}
```

## API

URL base local:

```text
http://localhost:3000
```

### Videojuegos

Obtener videojuegos:

```http
GET /api/juegos
```

Parámetros disponibles:

```text
buscar
genero
plataforma
orden
page
limit
```

Ejemplo:

```http
GET /api/juegos?buscar=elden&genero=RPG&page=1&limit=12
```

Obtener un videojuego por ID:

```http
GET /api/juegos/:id
```

Ejemplo:

```http
GET /api/juegos/1
```

Crear un videojuego:

```http
POST /api/juegos
```

Operación protegida mediante:

```http
x-api-key
```

Actualizar parcialmente un videojuego:

```http
PATCH /api/juegos/:id
```

Operación protegida mediante:

```http
x-api-key
```

Eliminar un videojuego:

```http
DELETE /api/juegos/:id
```

Operación protegida mediante:

```http
x-api-key
```

### Géneros

```http
GET /api/generos
```

### Plataformas

```http
GET /api/plataformas
```

### Reseñas editoriales

```http
GET /api/resenas
```

Permite filtrar por etiqueta:

```http
GET /api/resenas?etiqueta=Imprescindible
```

### Etiquetas

```http
GET /api/etiquetas
```

## Paginación

La respuesta de videojuegos incluye información de paginación:

```json
{
  "pagination": {
    "page": 1,
    "limit": 12,
    "total": 50,
    "totalPages": 5
  }
}
```

El valor máximo permitido para `limit` es:

```text
50
```

## Ordenación

Valores disponibles:

```text
titulo_asc
titulo_desc
puntuacion_asc
puntuacion_desc
fecha_asc
fecha_desc
```

## Seguridad

Las operaciones de lectura son públicas:

```http
GET
```

Las operaciones que modifican datos requieren una API key:

```http
POST
PATCH
DELETE
```

La clave debe enviarse mediante:

```http
x-api-key: TU_API_KEY
```

La API compara esta cabecera con:

```text
process.env.API_KEY
```

La clave real nunca debe almacenarse en GitHub ni exponerse en el frontend.

## Códigos de respuesta

La API utiliza códigos HTTP coherentes según la operación.

Ejemplos:

```text
200 → operación correcta
201 → recurso creado
400 → petición o parámetros inválidos
401 → API key no enviada
403 → API key incorrecta
404 → recurso o ruta no encontrada
500 → error interno del servidor
```

## CORS

El backend limita las peticiones del navegador al frontend permitido.

En desarrollo:

```env
FRONTEND_URL=http://localhost:4321
```

En producción esta variable se sustituirá por la URL pública del frontend.

## Arquitectura

```text
Frontend Astro + React
        ↓
      fetch
        ↓
Backend Node + Express
        ↓
   Pool MySQL
        ↓
Base de datos MySQL
```

El frontend nunca se conecta directamente a MySQL.

## Repositorios

Frontend:

https://github.com/alexgonzalez91/matchgame-frontend

Backend:

https://github.com/alexgonzalez91/matchgame-backend

## Despliegue previsto

```text
Frontend → Netlify
Backend  → Render
Database → MySQL externo
```

Las URLs públicas se añadirán cuando termine el despliegue.

## Proyecto educativo

MatchGame ha sido desarrollado como proyecto final de formación Full Stack.

El proyecto integra:

- Frontend con Astro y React.
- API REST con Node.js y Express.
- Base de datos relacional.
- CRUD completo.
- Búsqueda, filtros y ordenación.
- Paginación.
- Diseño responsive.
- Variables de entorno.
- Seguridad básica de operaciones administrativas.
- Despliegue web.

© 2026 MatchGame.