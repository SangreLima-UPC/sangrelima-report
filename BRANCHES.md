# Estructura de Ramas

## Ramas Principales

### `main`
- **Propósito**: Versión estable y lista para producción
- **Protección**: No se commitea directamente, solo mediante PRs desde `develop`
- **Política**: Historial limpio, cada commit es una versión estable

### `develop`
- **Propósito**: Rama de integración para trabajo en progreso
- **Protección**: Rama base para feature branches
- **Política**: Contenido en revisión antes de fusionar a main

## Ramas Temporales (Feature Branches)

Cuando necesites hacer cambios, crea una rama desde `develop`:

```bash
git checkout develop
git pull origin develop
git checkout -b feature/descripcion-del-cambio
```

### Nomenclatura

- `feature/nombre-descriptivo` - Nueva funcionalidad o sección
- `fix/descripcion-del-problema` - Correcciones de errores
- `docs/tema` - Cambios solo documentación
- `refactor/area` - Reestructuración de contenido

## Flujo de Trabajo

1. **Crear feature branch** desde `develop`
2. **Hacer cambios** en tu rama
3. **Commit** con mensajes descriptivos
4. **Push** a la rama
5. **Pull Request** a `develop`
6. **Review** de cambios
7. **Merge** a `develop`
8. Cuando esté listo, **PR desde develop a main**

## Convenciones de Commits

```
tipo: descripción breve

- Detalle 1
- Detalle 2
```

Tipos recomendados:
- `feat:` - Nueva característica o sección
- `fix:` - Corrección de errores
- `docs:` - Cambios en documentación
- `refactor:` - Reorganización sin cambios funcionales
- `style:` - Formato, nomenclatura
