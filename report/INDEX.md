# SangreLima - Informe Final IHC

**Curso:** 1ASI0385 - IHC y Tecnologías Móviles  
**Universidad:** Universidad Peruana de Ciencias Aplicadas (UPC)  
**Docente:** Kevin Edgar Salazar Ruiz  
**Lima, 14 de Septiembre del 2026**

---

## 📋 Tabla de Contenidos

### [Portada e Índice](portada_y_index.md)
- Logo de la startup
- Datos académicos
- Registro de versiones
- Student Outcomes

---

### [Capítulo I: Introducción](01-introduccion.md)
- 1.1. Startup Profile
  - 1.1.1. Descripción de la Startup
  - 1.1.2. Perfiles de integrantes del equipo
- 1.2. Solution Profile
  - 1.2.1. Antecedentes y problemática
  - 1.2.2. Lean UX Process
  - 1.2.3. Lean UX Problem Statements
  - 1.2.4. Lean UX Assumptions
  - 1.2.5. Lean UX Hypothesis Statements
  - 1.2.6. Lean UX Canvas
- 1.3. Segmentos objetivo

---

### [Capítulo II: Requirements Elicitation & Analysis](02-requirements.md)
- 2.1. Competidores
  - 2.1.1. Análisis Competitivo
  - 2.1.2. Estrategias y Tácticas Frente a Competidores
- 2.2. Entrevistas
  - 2.2.1. Diseño de entrevistas
  - 2.2.2. Registro de entrevistas
  - 2.2.3. Análisis de entrevistas
- 2.3. Needfinding
  - 2.3.1. User Personas
  - 2.3.2. User Task Matrix
  - 2.3.3. User Journey Mapping
  - 2.3.4. Empathy Mapping
  - 2.3.5. As-is Scenario Mapping

---

### [Capítulo III: Requirements Specification](03-specification.md)
- 3.1. To-Be Scenario Mapping
- 3.2. User Stories
- 3.3. Impact Mapping
- 3.4. Product Backlog

---

### [Capítulo IV: Product UX/UI Design](04-design.md)
- 4.1. Style Guidelines
  - 4.1.1. General Style Guidelines
  - 4.1.2. Web Style Guidelines
  - 4.1.3. Mobile Style Guidelines
- 4.2. Information Architecture
- 4.3. Landing Page UI Design
  - 4.3.1. Landing Page Wireframe
  - 4.3.2. Landing Page Mock-up
- 4.4. Mobile Applications UX/UI Design
  - 4.4.1. Mobile Applications Wireframes
  - 4.4.2. Mobile Applications Wireflow
  - 4.4.3. Primary Mobile Platform Mock-ups
  - 4.4.4. Primary Mobile Platform User Flow Diagrams
- 4.5. Mobile Applications Prototyping

---

### [Capítulo V: Product Implementation](05-implementation.md)
- 5.1. Software Configuration Management
  - 5.1.1. Software Development Environment Configuration
  - 5.1.2. Source Code Management
  - 5.1.3. Source Code Style Guide & Conventions
  - 5.1.4. Software Deployment Configuration
- 5.2. Product Implementation & Deployment
- 5.3. Video About-the-Product

---

### [Capítulo VI: Product Validation](06-validation.md)
- 6.1. Acceptance Tests
- 6.2. Entrevistas de validación
  - 6.2.1. Diseño de Entrevistas
  - 6.2.2. Registro de Entrevistas
  - 6.2.3. Evaluaciones según heurísticas

---

### [Conclusiones, Bibliografía y Anexos](07-conclusiones.md)

---

## 👥 Equipo

- Belon Carita, Jorge Mathias (u202322422)
- Campos Acosta, Fatima Brigit (u202521899)
- Calderon Mendoza, Sebastian Pavel (u202412227)
- Martín Farro, Alexis Sebastian (u202515871)
- Molina Benites, Luis Enrique (u202520955)
- Reyes Diaz, Frances Kamila (u202421764)

---

## 🔄 Cómo trabajar con este informe

**Para agregar/editar un capítulo:**
```bash
# Edita el archivo del capítulo (ej: 01-introduccion.md)
# Haz commit con un mensaje descriptivo
git add 01-introduccion.md
git commit -m "docs: Update chapter I with new findings"
```

**Para generar .docx final:**
```bash
./build-docx.sh
```

Esto generará `SangreLima-Informe-Final.docx` listo para entregar.

---

## 📌 Notas

- Todos los capítulos están versionados en Git
- Las imágenes se encuentran en `../assets/images/media/`
- Los nombres de archivos siguen el patrón: `NN-nombre_descriptivo.md`
- El archivo original `informe.md` se mantiene como backup
