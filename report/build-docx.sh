#!/bin/bash

# Script para convertir informe Markdown a .docx
# Requisito: tener pandoc instalado (sudo apt install pandoc)

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# Verificar que pandoc esté instalado
if ! command -v pandoc &> /dev/null; then
    echo "❌ Error: pandoc no está instalado"
    echo "Instálalo con: sudo apt install pandoc"
    exit 1
fi

echo "🔨 Generando documento final..."
echo ""

# Archivo de salida
OUTPUT="SangreLima-Informe-Final.docx"

# Ejecutar pandoc con todos los capítulos en orden
echo "Combinando capítulos..."
pandoc \
    portada_y_index.md \
    01-introduccion.md \
    02-requirements.md \
    03-specification.md \
    04-design.md \
    05-implementation.md \
    06-validation.md \
    07-conclusiones.md \
    -o "$OUTPUT" \
    --from markdown \
    --to docx \
    --toc \
    --toc-depth=2 \
    --reference-doc=/dev/null \
    2>/dev/null

if [ $? -eq 0 ]; then
    SIZE=$(du -h "$OUTPUT" | cut -f1)
    echo ""
    echo "✅ Documento generado exitosamente"
    echo "📄 Archivo: $OUTPUT ($SIZE)"
    echo ""
    echo "📌 Notas:"
    echo "   - Tabla de contenidos automática generada"
    echo "   - Imágenes incluidas desde ../assets/images/media/"
    echo "   - Listo para enviar a profesores"
else
    echo "❌ Error al generar el documento"
    exit 1
fi
