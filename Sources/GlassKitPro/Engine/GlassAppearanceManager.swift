import Observation
import SwiftUI
#if canImport(UIKit)
    import UIKit
#endif

/// Gestor global de apariencia para todos los componentes GlassKit.
@Observable
public final class GlassAppearanceManager {
    /// Tema lógico (no depende todavía de LDR/HDR).
    public enum Theme: String, CaseIterable {
        case darkTurquoise
        case lightBeige
        case solar
        case arctic
        case lava
        case imageBackground
    }

    /// Perfil de luz del dispositivo: aproximación LDR/HDR.
    /// - LDR: brillo bajo/medio, contraste suave.
    /// - HDR: brillo alto, colores más vivos y glows más intensos.
    public enum LightProfile {
        case ldr
        case hdr
    }

    /// Paleta completa para un tema dado + perfil de luz.
    public struct Palette {
        public let background: Color
        public let highlight: Color
        public let accent: Color
        public let glow: Color
    }

    /// Tema actual elegido en la UI.
    public var theme: Theme = .darkTurquoise

    public init() {}

    // MARK: - Perfil de luz (LDR / HDR)

    /// Detecta el perfil de luz actual del dispositivo.
    /// En iOS usamos el brillo de pantalla como proxy.
    public static func detectLightProfile() -> LightProfile {
        #if canImport(UIKit)
            let brightness = UIScreen.main.brightness
            return brightness > 0.7 ? .hdr : .ldr
        #else
            return .ldr
        #endif
    }

    // MARK: - Paletas por tema + perfil

    public static func palette(for theme: Theme,
                               profile: LightProfile = detectLightProfile()) -> Palette
    {
        switch (theme, profile) {
        // TURQUESA OSCURO
        case (.darkTurquoise, .ldr):
            Palette(
                background: Color(red: 0.00, green: 0.45, blue: 0.55),
                highlight: Color(red: 0.00, green: 0.70, blue: 0.80),
                accent: Color.cyan,
                glow: Color.cyan.opacity(0.45)
            )

        case (.darkTurquoise, .hdr):
            Palette(
                background: Color(red: 0.00, green: 0.60, blue: 0.78),
                highlight: Color.cyan,
                accent: Color.white,
                glow: Color.cyan.opacity(0.80)
            )

        // BEIGE CLARO
        case (.lightBeige, .ldr):
            Palette(
                background: Color(red: 0.96, green: 0.80, blue: 0.62),
                highlight: Color(red: 1.00, green: 0.90, blue: 0.75),
                accent: Color.orange.opacity(0.85),
                glow: Color.orange.opacity(0.35)
            )

        case (.lightBeige, .hdr):
            Palette(
                background: Color(red: 0.99, green: 0.88, blue: 0.72),
                highlight: Color(red: 1.00, green: 0.96, blue: 0.84),
                accent: Color.white,
                glow: Color.orange.opacity(0.65)
            )

        // SOLAR
        case (.solar, .ldr):
            Palette(
                background: Color(red: 1.00, green: 0.65, blue: 0.25),
                highlight: Color(red: 1.00, green: 0.82, blue: 0.35),
                accent: Color.yellow.opacity(0.9),
                glow: Color.orange.opacity(0.6)
            )

        case (.solar, .hdr):
            Palette(
                background: Color(red: 1.00, green: 0.72, blue: 0.28),
                highlight: Color(red: 1.00, green: 0.91, blue: 0.42),
                accent: Color.white,
                glow: Color.yellow.opacity(0.9)
            )

        // ARCTIC
        case (.arctic, .ldr):
            Palette(
                background: Color(red: 0.70, green: 0.85, blue: 1.00),
                highlight: Color(red: 0.84, green: 0.93, blue: 1.00),
                accent: Color.blue.opacity(0.85),
                glow: Color.cyan.opacity(0.5)
            )

        case (.arctic, .hdr):
            Palette(
                background: Color(red: 0.60, green: 0.82, blue: 1.00),
                highlight: Color(red: 0.88, green: 0.96, blue: 1.00),
                accent: Color.white,
                glow: Color.cyan.opacity(0.9)
            )

        // LAVA
        case (.lava, .ldr):
            Palette(
                background: Color(red: 0.18, green: 0.02, blue: 0.02),
                highlight: Color(red: 0.65, green: 0.16, blue: 0.12),
                accent: Color.red.opacity(0.9),
                glow: Color.red.opacity(0.7)
            )

        case (.lava, .hdr):
            Palette(
                background: Color(red: 0.08, green: 0.00, blue: 0.00),
                highlight: Color(red: 0.85, green: 0.18, blue: 0.15),
                accent: Color.white,
                glow: Color.red.opacity(1.0)
            )

        // IMAGEN DE FONDO
        case (.imageBackground, _):
            // La paleta sigue existiendo para consistencia, aunque el fondo lo pone una imagen.
            Palette(
                background: Color.black.opacity(0.75),
                highlight: Color.white.opacity(0.35),
                accent: Color.cyan,
                glow: Color.cyan.opacity(0.6)
            )
        }
    }

    // MARK: - Fondos

    /// Vista de fondo principal según tema + perfil de luz.
    public static func view(for theme: Theme,
                            profile: LightProfile = detectLightProfile()) -> AnyView
    {
        switch theme {
        case .imageBackground:
            // Imagen de fondo + overlay según paleta
            let palette = palette(for: theme, profile: profile)
            return AnyView(
                ZStack {
                    Image("Background")
                        .resizable()
                        .scaledToFill()
                        .overlay(
                            LinearGradient(
                                colors: [
                                    palette.background.opacity(0.4),
                                    palette.background.opacity(0.9),
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    Color.black.opacity(profile == .hdr ? 0.35 : 0.55)
                }
                .ignoresSafeArea()
            )

        default:
            let palette = palette(for: theme, profile: profile)
            return AnyView(
                LinearGradient(
                    colors: [
                        palette.background,
                        palette.glow,
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            )
        }
    }

    /// Fondo actual reactivo al tema (y dinámico a LDR/HDR).
    public var backgroundView: AnyView {
        Self.view(for: theme)
    }
}
