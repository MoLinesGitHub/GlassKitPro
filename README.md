╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
┃                                                                            ┃
┃                🌊  G L A S S K I T   L I Q U I D   F R A M E               ┃
┃              (CrystalWave™ Fluid Container • UltraThin • Glow)             ┃
┃                                                                            ┃
╰╮                                                                            ╭╯
 ╰─────────── ✦  R E A D M E . M D   –   G L A S S K I T P R O  ✦ ───────────╯

<div align="center">
  
# 🌟 GlassKitPro  
### Ultra-modern Liquid/Crystal Glass UI Framework  
#### Swift 6.2 • iOS 17+ • Modular • LDR/HDR Aware • SwiftData • Real-time Animations
  
![Swift](https://img.shields.io/badge/Swift-6.2-orange?style=for-the-badge&logo=swift)
![iOS](https://img.shields.io/badge/iOS-17+-lightgrey?style=for-the-badge&logo=apple)
![SPM](https://img.shields.io/badge/SPM-Compatible-brightgreen?style=for-the-badge)
![SwiftData](https://img.shields.io/badge/SwiftData-Integrated-blue?style=for-the-badge)
![Metal](https://img.shields.io/badge/Metal-Shaders-purple?style=for-the-badge)

</div>

---

# ✨ Overview

**GlassKitPro** es un framework modular de UI basado en SwiftUI, diseñado para crear interfaces ultra modernas con efectos:

- Cristal líquido fluido  
- Cristal fracturado tipo iOS 26  
- Capas de profundidad (Depth Glass)  
- Fondos animados tipo Metal shader  
- Partículas flotantes  
- Transiciones de cristalización  
- Botones, métricas, dashboards, sidebars, carousels  
- Theming avanzado (LDR/HDR, Solar, Arctic, Lava, Image Mode…)  
- Persistencia con **SwiftData**  
- Animaciones globales con **GlassKitProAnimations**

Perfecto para aplicaciones premium, dashboards, UIs tipo Apple Music, VisionOS-like, interfaces futuristas o apps con estética líquida/dinámica.

---

# 🚀 Features

### 🎨 **Crystal Liquid + Fractured Glass Effects**
- Materiales dinámicos
- Brillos, highlights, fracturas geométricas
- UltraThin / Thin / Thick Material combinados

### 🎛 **Theme Engine (LDR/HDR smart mode)**
- Theming reactivo al brillo del dispositivo (LDR, HDR)
- Paletas completas por tema
- Imagen de fondo con overlay dinámico

### 💾 **SwiftData Integration**
- Persistencia automática del tema seleccionado
- `GlassThemeEntity` incluido

### 🧬 **Animations Module**
- `shimmer`
- `pulse`
- `flip3D`

### ✨ **Full Components Set**
Incluye más de 20 componentes:

- `LiquidGlassMaterial`
- `FracturedCrystalEffect`
- `DepthLayeredGlass`
- `CrystalLiquidCard`
- `CrystalNavigationBar`
- `CrystalMetricCard`
- `FrostedSidebarGlass`
- `DynamicGlassCarousel`
- `AdvancedGlassButton`
- `AdvancedGlassCard`
- `AdvancedDashboardGlass`
- `GlassHeroBanner`
- `LiquidFlowBackground`
- `CrystalParticles`

### 🧪 **Demo App incluida**
- Ejemplo completo con el motor de temas, panel pro, navegación por anclas y todos los componentes.

---

# 📦 Installation (Swift Package Manager)

En Xcode:

**File → Add Packages…**

Introduce la URL del repositorio:

```
https://github.com/MoLinesGitHub/GlassKitPro
```

Selecciona el package, y asegúrate de añadir los targets:

- `GlassKitPro`
- `GlassKitProAnimations`

---

# 🧭 Usage

## 1. Configurar el motor de temas (con SwiftData)

```swift
import SwiftUI
import SwiftData
import GlassKitPro

@main
struct MyApp: App {
    @State private var glassManager = GlassAppearanceManager()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(glassManager)
                .modelContainer(for: GlassThemeEntity.self)
        }
    }
}
```

---

## 2. Usar un componente Crystal

```swift
import GlassKitPro

var body: some View {
    GlassKit.CrystalMetricCard(
        title: "Velocidad",
        value: "98%",
        subtitle: "+12%",
        trend: .up,
        accentColor: .green
    )
    .frame(width: 260)
}
```

---

## 3. Panel de temas (con previews en vivo)

```swift
GlassKitThemeControlCenter(manager: glassManager)
```

---

## 4. Fondo inteligente LDR/HDR

```swift
GlassAppearanceManager.view(for: glassManager.theme)
```

---

## 5. Animación global (ejemplo)

```swift
withAnimation(GlassAnimations.flip3D) {
    isFlipped.toggle()
}
```

---

# 🧩 Included Demo App

El paquete incluye un target ejecutable:

- `GlassKitProDemoApp`

Ejecuta una demo completa con:

- Crystal Hero Banner  
- Advanced Dashboard  
- Carrusel Glass  
- Sidebar  
- Panel de temas  
- Partículas + Liquid Background  
- Navegación por secciones con scroll automático

---

# 🧙 Architecture

```
GlassKitPro/
 ├─ Engine/
 │    ├─ GlassAppearanceManager.swift
 │    ├─ GlassThemeEntity.swift
 │    └─ GlassKit.swift
 ├─ Components/
 │    ├─ LiquidGlassMaterial.swift
 │    ├─ DepthLayeredGlass.swift
 │    ├─ CrystalLiquidCard.swift
 │    ├─ …
 ├─ Shaders/
 │    └─ GlassNoiseShader.metal
 ├─ Resources/
 │    └─ Background.png
 ├─ Demo/
 │    ├─ CrystalKitProPanel.swift
 │    ├─ GlassKitDemoContainer.swift
 │    └─ GlassKitThemeControlCenter.swift
 └─ Documentation/
      └─ GlassKitPro.docc
```

---

# 📘 Documentation

GlassKitPro incluye un bundle **DocC**:

```
Documentation/GlassKitPro.docc
```

Puedes abrirlo con:

```
Xcode → Product → Build Documentation
```

---

# 📅 Roadmap

### v1.1 — (Próxima)
- Vibrancy real (Layer-based)
- Efectos Bloom regulados
- Motion parallax con acelerómetro
- Transiciones estilo visionOS

### v1.2
- Integración real con shaders dinámicos Metal
- Fondo líquido reactivo al audio input
- GlassKitStudio (editor visual)

### v2.0
- VisionOS compositor
- Layouts fluidos con profundidad 3D real
- Efectos de fusión multilayer

---

# 🤝 Contributing

Pull Requests bienvenidos:

- Nuevos componentes
- Shaders
- Paletas de color
- Optimización de animaciones
- Nuevas transiciones

---

# 🛡 License

**MIT License**
Libre para uso comercial, personal y educativo.

---

<div align="center">

### ⭐ If you like GlassKitPro, consider starring the repo!

</div>

╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
┃               End of “Liquid Crystal Container – GlassKitPro”              ┃
╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯

---

## 📝 Changelog

### v1.0.1 (Dec 3, 2025) - Swift 6.2 Compatibility Fix ✅
**Correcciones de compilación y compatibilidad**

#### 🐛 Bugs Corregidos:
- Añadidas llaves de cierre faltantes en componentes:
  * `AdvancedDashboardGlass`
  * `AdvancedGlassButton`
  * `AdvancedGlassCard`
  * `AppToolbarGlass`
- Eliminadas extensiones duplicadas en:
  * `CrystalFloatingActionButton`
  * `CrystalLiquidCard`
- Completada implementación de `CrystalMetricCard`

#### ⚡ Swift 6.2 Strict Concurrency:
- **CrystalParticles**: Corregida violación de MainActor
  * Reemplazado `UIScreen.main.bounds` estático por valores dinámicos
  * Ahora compatible con `strict concurrency` de Swift 6.2
  
#### ✅ Resultado:
- **0 errores de compilación**
- **0 warnings**
- Totalmente compatible con Xcode 17+ y Swift 6.2

---

## 🚀 Cómo Usar en Nuevos Proyectos

### Opción 1: Swift Package Manager (Recomendado)

1. En Xcode, ve a **File → Add Package Dependencies...**
2. Pega la URL del repositorio:
   ```
   https://github.com/MoLinesGitHub/GlassKitPro.git
   ```
3. Selecciona la versión: **1.0.1** o superior
4. Añade el paquete a tu target

### Opción 2: Local Package

Si prefieres usar la copia local:

1. Arrastra la carpeta `GlassKitPro` a tu proyecto Xcode
2. O en Xcode: **File → Add Package Dependencies → Add Local...**
3. Selecciona la ruta:
   ```
   /Volumes/SSD/xCode_Projects/MoLines Designs - Swift Package Dependencies/GlassKitPro
   ```

### Importar y Usar:

```swift
import GlassKitPro

struct MyView: View {
    var body: some View {
        VStack {
            // Botón cristalino
            GlassKit.AdvancedGlassButton(
                title: "Tap me",
                icon: "star.fill"
            )
            
            // Tarjeta de métrica
            GlassKit.CrystalMetricCard(
                title: "Revenue",
                value: "$12.5K",
                subtitle: "+15% vs last month",
                trend: .up,
                accentColor: .green
            )
            
            // Efecto de partículas
            GlassKit.CrystalParticles()
        }
    }
}
```

---

## 🔒 Garantía de Calidad

Esta versión ha sido:
- ✅ Compilada exitosamente con Swift 6.2
- ✅ Testeada en Xcode 17.0+
- ✅ Verificada sin warnings
- ✅ Compatible con strict concurrency mode
- ✅ Lista para producción

**Última actualización:** Diciembre 3, 2025
