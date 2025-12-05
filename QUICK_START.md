# 🚀 GlassKitPro - Guía Rápida de Uso

## 📦 Instalación en Nuevos Proyectos

### Método 1: Via GitHub (Recomendado)

```
1. Abrir tu proyecto en Xcode
2. File → Add Package Dependencies...
3. Pegar URL: https://github.com/MoLinesGitHub/GlassKitPro.git
4. Seleccionar versión: "1.0.1" o "Up to Next Major"
5. Add to Target
```

### Método 2: Paquete Local

Si prefieres tener una copia local:

```bash
# 1. Clonar el repositorio
cd ~/Documents/SwiftPackages
git clone https://github.com/MoLinesGitHub/GlassKitPro.git

# 2. En Xcode:
File → Add Package Dependencies → Add Local...
# Seleccionar la carpeta GlassKitPro
```

### Método 3: Usar tu copia existente

Tu copia ya corregida está en:
```
/Volumes/SSD/xCode_Projects/Cortes/GlassKitPro
```

En cualquier proyecto nuevo:
```
File → Add Package Dependencies → Add Local...
Seleccionar: /Volumes/SSD/xCode_Projects/Cortes/GlassKitPro
```

---

## 💡 Ejemplos de Uso

### 1️⃣ Botón Glass Básico

```swift
import SwiftUI
import GlassKitPro

struct ContentView: View {
    var body: some View {
        GlassKit.AdvancedGlassButton(
            title: "Get Started",
            icon: "arrow.right.circle.fill"
        )
    }
}
```

### 2️⃣ Tarjeta de Métrica

```swift
GlassKit.CrystalMetricCard(
    title: "Monthly Sales",
    value: "$45.2K",
    subtitle: "+12.5% vs last month",
    trend: .up,
    accentColor: .green
)
.padding()
```

### 3️⃣ Dashboard Completo

```swift
struct DashboardView: View {
    var body: some View {
        ZStack {
            // Fondo con partículas
            GlassKit.CrystalParticles()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Barra de navegación
                GlassKit.CrystalNavigationBar(
                    title: "Dashboard",
                    subtitle: "Welcome back",
                    leadingIcon: "line.3.horizontal",
                    leadingAction: { print("Menu") },
                    trailingIcon: "person.circle.fill",
                    trailingAction: { print("Profile") }
                )
                
                // Métricas
                HStack(spacing: 16) {
                    GlassKit.CrystalMetricCard(
                        title: "Revenue",
                        value: "$12.5K",
                        trend: .up,
                        accentColor: .green
                    )
                    
                    GlassKit.CrystalMetricCard(
                        title: "Users",
                        value: "1,234",
                        trend: .up,
                        accentColor: .blue
                    )
                }
                .padding(.horizontal)
                
                // Panel avanzado
                GlassKit.AdvancedDashboardGlass()
                    .padding()
                
                Spacer()
            }
        }
    }
}
```

### 4️⃣ Tarjeta Líquida Personalizada

```swift
GlassKit.CrystalLiquidCard(
    title: "Achievements",
    accentColor: .purple,
    intensity: 0.8
) {
    VStack(alignment: .leading, spacing: 12) {
        HStack {
            Image(systemName: "star.fill")
                .foregroundStyle(.yellow)
            Text("Level 42")
                .font(.headline)
        }
        
        ProgressView(value: 0.75)
            .tint(.purple)
        
        Text("75% to next level")
            .font(.caption)
            .foregroundStyle(.secondary)
    }
}
.padding()
```

### 5️⃣ Botón de Acción Flotante

```swift
GlassKit.CrystalFloatingActionButton(
    icon: "plus",
    label: "New Item",
    accentColor: .blue
) {
    print("FAB tapped!")
}
```

---

## 🎨 Componentes Disponibles

| Componente | Descripción | Uso Principal |
|------------|-------------|---------------|
| `AdvancedGlassButton` | Botón interactivo con ripple | CTAs, acciones principales |
| `AdvancedGlassCard` | Tarjeta 3D con tilt | Contenido destacado |
| `AdvancedDashboardGlass` | Panel de métricas | Dashboards |
| `CrystalFloatingActionButton` | FAB animado | Acción principal flotante |
| `CrystalLiquidCard` | Tarjeta con gradiente líquido | Contenido personalizado |
| `CrystalMetricCard` | Tarjeta de KPIs | Métricas y estadísticas |
| `CrystalNavigationBar` | Nav bar personalizada | Navegación de app |
| `CrystalParticles` | Sistema de partículas | Fondos animados |
| `AppToolbarGlass` | Toolbar moderno | Herramientas de app |
| `FrostedSidebarGlass` | Sidebar esmerilado | Menús laterales |
| `GlassHeroBanner` | Hero section | Pantallas de inicio |

---

## ⚙️ Requisitos

- **iOS:** 17.0+
- **Swift:** 6.2+
- **Xcode:** 17.0+
- **Concurrency:** Strict mode compatible ✅

---

## 🔧 Configuración del Proyecto

Si usas el paquete en un proyecto nuevo, asegúrate de tener estas configuraciones:

### Package.swift (si creas tu propio paquete)

```swift
// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Cortes",
    platforms: [
        .iOS(.v17)
    ],
    dependencies: [
        .package(
            url: "https://github.com/MoLinesGitHub/GlassKitPro.git",
            from: "1.0.1"
        )
    ],
    targets: [
        .target(
            name: "Cortes",
            dependencies: ["GlassKitPro"]
        )
    ]
)
```

### Build Settings en Xcode

Si usas strict concurrency (recomendado):

```
Build Settings → Swift Compiler - Language
• Strict Concurrency Checking: Complete
• Swift Language Version: Swift 6
```

---

## 🐛 Solución de Problemas

### Error: "Cannot find 'GlassKit' in scope"

**Solución:**
```swift
import GlassKitPro  // ← Asegúrate de importar el módulo
```

### Error: "Module 'GlassKitPro' has no member 'GlassKit'"

**Solución:** Verifica que estás usando v1.0.1 o superior:
```bash
cd /Volumes/SSD/xCode_Projects/Cortes/GlassKitPro
git fetch --tags
git checkout v1.0.1
```

### Build falla con errores de concurrency

**Solución:** Tu proyecto debe usar Swift 6.2+:
```
Target → Build Settings → Swift Language Version → Swift 6
```

---

## 📚 Recursos Adicionales

- **README completo:** `README.md` en el repositorio
- **Release Notes:** `RELEASE_NOTES.md` para detalles de versiones
- **Ejemplos:** La carpeta `Demo/` contiene ejemplos de uso

---

## ✅ Checklist de Integración

Antes de usar GlassKitPro en producción:

- [ ] Versión 1.0.1 o superior instalada
- [ ] Swift 6.2+ configurado
- [ ] Xcode 17.0+ instalado
- [ ] Import correcto: `import GlassKitPro`
- [ ] Proyecto compila sin warnings
- [ ] Tests de UI pasan correctamente
- [ ] Performance validado en dispositivos reales

---

## 🎯 Próximos Pasos

1. **Explora los componentes** en tu proyecto de prueba
2. **Personaliza los colores** según tu diseño
3. **Combina múltiples componentes** para crear UIs únicas
4. **Reporta feedback** si encuentras mejoras

---

**Última actualización:** Diciembre 3, 2025  
**Versión del paquete:** 1.0.1  
**Mantenedor:** MoLines
