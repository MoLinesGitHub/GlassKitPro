# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

GlassKitPro is a modular SwiftUI framework for creating glass/crystal UI effects. It provides liquid glass materials, fractured crystal effects, depth layers, animated backgrounds, and theming with LDR/HDR awareness.

- **Swift 6.0** with strict concurrency enabled
- **Platforms:** iOS 17+, macOS 14+, watchOS 10+, visionOS 1+
- **SwiftData** integration for theme persistence

## Build Commands

```bash
# Build the package
swift build

# Build for release
swift build -c release

# Run validation script (checks syntax, balanced braces, concurrency issues)
./validate.sh

# Build documentation
# Open in Xcode: Product → Build Documentation
```

## Architecture

### Target Structure
- **GlassKitPro** - Main library with components, engine, shaders, and resources
- **GlassKitProAnimations** - Standalone animation utilities (shimmer, pulse, flip3D)
- **GlassKitProDemoApp** - Executable demo at `Examples/GlassKitProDemoApp/`

### Core Pattern: GlassKit Namespace
All public components are exposed via extensions on the `GlassKit` enum (defined in `Engine/GlassKit.swift`):

```swift
public extension GlassKit {
    struct MyComponent: View { ... }
}

// Usage
GlassKit.CrystalMetricCard(...)
```

### Engine Layer (`Sources/GlassKitPro/Engine/`)
- **GlassAppearanceManager** - `@Observable` theme manager with LDR/HDR-aware palettes. Detects device brightness to switch between light profiles.
- **GlassThemeEntity** - SwiftData model for persisting theme selection
- **Theme enum** - darkTurquoise, lightBeige, solar, arctic, lava, imageBackground

### Component Layer (`Sources/GlassKitPro/Components/`)
UI components follow a consistent pattern:
- Extend `GlassKit` namespace
- Use SwiftUI's `View` protocol
- Support accent colors and intensity parameters
- Apply `.ultraThinMaterial` or similar for glass effects

### Shaders (`Sources/GlassKitPro/Shaders/`)
Metal shaders for noise effects. Currently includes `GlassNoiseShader.metal`.

## Key Patterns

### Theme Integration
```swift
@State private var manager = GlassAppearanceManager()

// In view
GlassAppearanceManager.view(for: manager.theme)  // Background
GlassAppearanceManager.palette(for: manager.theme)  // Colors
```

### SwiftData Setup
```swift
.modelContainer(for: GlassThemeEntity.self)
```

### Concurrency Compliance
The codebase uses `StrictConcurrency` experimental feature. Avoid static `UIScreen.main.bounds` - use computed properties or pass dimensions dynamically.
