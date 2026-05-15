# Automatización API Trello (Postman) ![Status](https://img.shields.io/badge/status-active-success) ![License](https://img.shields.io/badge/license-MIT-blue) ![Postman](https://img.shields.io/badge/postman-v10+-orange) ![Newman](https://img.shields.io/badge/newman-html_extra-green)

Este proyecto es un framework profesional de automatización para la API de **Trello** (`Boards`, `Labels`, `Cards`). Está diseñado bajo estándares de **Arquitectura de Calidad** y **Clean Code**, priorizando la eficiencia, la seguridad y la facilidad de mantenimiento.

---

## ✨ Fundamentos de Arquitectura y Calidad Técnica

Esta colección no es solo un conjunto de peticiones; es un sistema de pruebas robusto que implementa lo siguiente:

- **Manejo Dinámico de Estado y Repetibilidad Segura**: El framework gestiona variables dinámicas en tiempo de ejecución. Para garantizar que cada corrida sea pura, el sistema **borra valores previos y los vuelve a crear**, asegurando que los datos no se mezclen entre ejecuciones.
- **Validación Automática de Esquemas (Schema Verification)**: Cada respuesta es verificada contra un esquema JSON definido. Esto garantiza que la estructura de la API no haya cambiado (detección de breaking changes).
- **Centralización y Reutilización de Código (DRY)**: 
  - Uso de una **función global maestra** invocada con `eval()` para ejecutar 9 pruebas críticas de manera uniforme.
  - **Lógica en Scripts Previos (Pre-request)**: Orquestación de múltiples escenarios (Data-Driven) desde una sola petición, reduciendo drásticamente la duplicación de código.
- **Clean Code (Código Limpio)**: Scripts legibles, variables bien nombradas y lógica modularizada según las mejores prácticas de la industria.

---

## 🔑 Configuración de Credenciales (Trello API)

Para que el proyecto funcione, debes generar tus propias credenciales en Trello:

1. **Obtener tu API Key**: Ve a [Trello Power-Up Admin Dashboard](https://trello.com/power-ups/admin) y crea un nuevo Power-Up para obtener tu `Key`.
2. **Generar tu Token**: Desde la misma página del Power-Up, busca el enlace para generar un token de acceso manualmente.
3. **Configurar en el Proyecto**:
   - Puedes ingresarlos manualmente en el entorno de Postman.
   - Si usas el archivo `.bat`, deberás sustituir los campos `<INGRESA_TU_KEY>` y `<INGRESA_TU_TOKEN>` con tus valores reales.

---

## 🚀 Comenzando

### 📋 Pre-requisitos
1. **Node.js**: Instalado en tu sistema.
2. **Postman**: Para pruebas manuales y depuración.
3. **Instalación de Newman**:
   ```bash
   npm install -g newman newman-reporter-htmlextra
   ```

---

## ⚙ Ejecución y Reportes

El flujo de ejecución está totalmente automatizado mediante **Newman**. 

### Ejecución por Consola / Scripts Automatizados

El proyecto incluye scripts preparados para ejecutarse en Windows (`.bat`) y sistemas Unix/Linux (`.sh`). Estos scripts solicitarán tus credenciales de forma segura para no exponerlas en el código.

#### 1. Usando los Scripts (Recomendado)
- **Windows**: Ejecuta el archivo `ejecutar_reporte_newman.bat`.
- **Bash/Linux**: Ejecuta `bash ejecutar_reporte.sh`.

#### 2. Ejecución Manual por Consola
Si prefieres ejecutar el comando directamente, utiliza la siguiente estructura sustituyendo tus credenciales:

```bash
npx newman run "apiTrello.postman_collection.json" \
  -e "apiTrello.postman_environment.json" \
  --env-var "url_base=https://api.trello.com/1" \
  --env-var "api_key=TU_API_KEY" \
  --env-var "token=TU_TOKEN" \
  -r htmlextra,cli \
  --reporter-htmlextra-darkTheme \
  --reporter-htmlextra-title "Reporte_Trello_Framework" \
  --reporter-htmlextra-export "./Reporte_Trello_Framework.html"
```

### 📊 Reporte Visual
Al terminar la ejecución, se genera un archivo `Reporte_Trello_Framework.html` con un tema oscuro profesional, proporcionando una visión detallada de cada aserción, tiempo de respuesta y validación de esquema.

---
<img width="1915" height="939" alt="image" src="https://github.com/user-attachments/assets/5f463c4f-615e-4663-96a2-7ec934762414" />


## 📂 Estructura del Proyecto
```text
proyectoTrello/
├── apiTrello.postman_collection.json   # Código fuente de las pruebas (Test Suite).
├── apiTrello.postman_environment.json  # Configuración de variables de entorno.
├── ejecutar_reporte_newman.bat         # Automatización de ejecución en Windows.
├── ejecutar_reporte.sh                 # Automatización de ejecución en Bash/Linux.
├── Reporte_Trello_Framework.html       # (Generado) Informe de resultados visual.
└── README.md                           # Documentación técnica principal.
```

---

## 📜 Licencia
The MIT License (MIT).
