#!/bin/bash

# GlassKitPro - Script de Validación
# Verifica que el paquete está correctamente configurado y compilable
# Uso: ./validate.sh

set -e

echo "🔍 GlassKitPro Validation Script"
echo "=================================="
echo ""

# Colores para output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Función para mensajes
print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${YELLOW}ℹ️  $1${NC}"
}

# 1. Verificar que estamos en el directorio correcto
echo "1️⃣  Verificando ubicación..."
if [ ! -f "Package.swift" ]; then
    print_error "No se encuentra Package.swift. Asegúrate de estar en el directorio raíz de GlassKitPro"
    exit 1
fi
print_success "Ubicación correcta"
echo ""

# 2. Verificar versión de Git
echo "2️⃣  Verificando versión de Git..."
CURRENT_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "sin tag")
CURRENT_COMMIT=$(git rev-parse --short HEAD)
print_info "Tag actual: $CURRENT_TAG"
print_info "Commit: $CURRENT_COMMIT"

if [ "$CURRENT_TAG" = "sin tag" ]; then
    print_error "No hay tags. Deberías crear uno: git tag -a v1.0.1 -m 'Release'"
else
    print_success "Tag encontrado: $CURRENT_TAG"
fi
echo ""

# 3. Verificar cambios sin commit
echo "3️⃣  Verificando estado de Git..."
if [ -n "$(git status --porcelain)" ]; then
    print_error "Hay cambios sin commit:"
    git status --short
    echo ""
    print_info "Ejecuta: git add . && git commit -m 'mensaje' && git push"
else
    print_success "No hay cambios sin commit"
fi
echo ""

# 4. Verificar archivos críticos
echo "4️⃣  Verificando archivos críticos..."
CRITICAL_FILES=(
    "Package.swift"
    "README.md"
    "RELEASE_NOTES.md"
    "QUICK_START.md"
    "Sources/GlassKitPro/Engine/GlassKit.swift"
    "Sources/GlassKitPro/Components/CrystalParticles.swift"
)

for file in "${CRITICAL_FILES[@]}"; do
    if [ -f "$file" ]; then
        print_success "$file existe"
    else
        print_error "$file NO EXISTE"
    fi
done
echo ""

# 5. Contar componentes
echo "5️⃣  Contando componentes disponibles..."
COMPONENT_COUNT=$(find Sources/GlassKitPro/Components -name "*.swift" -type f | wc -l | tr -d ' ')
print_info "Total de componentes: $COMPONENT_COUNT"
if [ "$COMPONENT_COUNT" -lt 10 ]; then
    print_error "Faltan componentes (esperados: ~13)"
else
    print_success "Número de componentes correcto"
fi
echo ""

# 6. Verificar sintaxis de Swift
echo "6️⃣  Verificando sintaxis Swift..."
if command -v swiftc &> /dev/null; then
    SYNTAX_ERRORS=0
    while IFS= read -r file; do
        if ! swiftc -typecheck "$file" 2>/dev/null; then
            print_error "Error de sintaxis en: $file"
            SYNTAX_ERRORS=$((SYNTAX_ERRORS + 1))
        fi
    done < <(find Sources -name "*.swift" -type f)
    
    if [ $SYNTAX_ERRORS -eq 0 ]; then
        print_success "Sintaxis correcta en todos los archivos"
    else
        print_error "Se encontraron $SYNTAX_ERRORS archivos con errores de sintaxis"
    fi
else
    print_info "swiftc no disponible, saltando verificación de sintaxis"
fi
echo ""

# 7. Verificar llaves balanceadas
echo "7️⃣  Verificando llaves balanceadas..."
UNBALANCED=0
while IFS= read -r file; do
    OPEN_COUNT=$(grep -o '{' "$file" | wc -l | tr -d ' ')
    CLOSE_COUNT=$(grep -o '}' "$file" | wc -l | tr -d ' ')
    
    if [ "$OPEN_COUNT" -ne "$CLOSE_COUNT" ]; then
        print_error "$(basename "$file"): { =$OPEN_COUNT, } =$CLOSE_COUNT (desbalanceado)"
        UNBALANCED=$((UNBALANCED + 1))
    fi
done < <(find Sources -name "*.swift" -type f)

if [ $UNBALANCED -eq 0 ]; then
    print_success "Todas las llaves están balanceadas"
else
    print_error "$UNBALANCED archivos con llaves desbalanceadas"
fi
echo ""

# 8. Buscar problemas de concurrency conocidos
echo "8️⃣  Buscando problemas de concurrency..."
if grep -r "UIScreen.main.bounds" Sources/ 2>/dev/null | grep "static let"; then
    print_error "Encontrado uso problemático de UIScreen.main.bounds en contexto estático"
else
    print_success "No se encontraron problemas de concurrency conocidos"
fi
echo ""

# 9. Verificar que no hay archivos backup
echo "9️⃣  Verificando archivos temporales..."
BACKUP_FILES=$(find . -name "*.bak" -o -name "*.swp" -o -name "*~" 2>/dev/null | wc -l | tr -d ' ')
if [ "$BACKUP_FILES" -gt 0 ]; then
    print_error "Se encontraron $BACKUP_FILES archivos temporales"
    find . -name "*.bak" -o -name "*.swp" -o -name "*~"
else
    print_success "No hay archivos temporales"
fi
echo ""

# 10. Resumen final
echo "📊 RESUMEN"
echo "=========="
print_info "Versión actual: $CURRENT_TAG"
print_info "Commit: $CURRENT_COMMIT"
print_info "Componentes: $COMPONENT_COUNT"
echo ""

# Verificar si todo está OK
if [ "$CURRENT_TAG" != "sin tag" ] && \
   [ -z "$(git status --porcelain)" ] && \
   [ $UNBALANCED -eq 0 ] && \
   [ $BACKUP_FILES -eq 0 ]; then
    echo ""
    print_success "✨ TODO CORRECTO - El paquete está listo para usar ✨"
    echo ""
    print_info "Para usar en un nuevo proyecto:"
    echo "  1. File → Add Package Dependencies..."
    echo "  2. URL: https://github.com/MoLinesGitHub/GlassKitPro.git"
    echo "  3. Version: $CURRENT_TAG"
    echo ""
else
    echo ""
    print_error "⚠️  HAY PROBLEMAS - Revisa los errores anteriores"
    echo ""
fi

exit 0
