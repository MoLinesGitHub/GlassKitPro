import SwiftUI
import SwiftData

public struct GlassKitThemeControlCenter: View {
    @Bindable public var manager: GlassAppearanceManager

    @Environment(\.modelContext) private var modelContext
    @Query private var storedThemes: [GlassThemeEntity]

    public init(manager: GlassAppearanceManager) {
        self.manager = manager
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "paintpalette.fill")
                    .font(.headline)
                Text("Glass Themes")
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .tracking(0.8)
                Spacer()
            }
            .foregroundStyle(.white.opacity(0.9))

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(GlassAppearanceManager.Theme.allCases, id: \.self) { theme in
                        Button {
                            select(theme)
                        } label: {
                            themeChip(for: theme)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 4)
            }
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 22)
                .fill(.ultraThickMaterial)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(Color.white.opacity(0.35), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.45), radius: 26, y: 18)
        .padding(.horizontal)
        .onAppear {
            restorePersistedThemeIfNeeded()
        }
    }

    // MARK: - UI helpers

    private func themeChip(for theme: GlassAppearanceManager.Theme) -> some View {
        let isSelected = (theme == manager.theme)
        let preview = GlassAppearanceManager.view(for: theme)

        return VStack(alignment: .leading, spacing: 6) {
            preview
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(
                            Color.white.opacity(isSelected ? 0.9 : 0.4),
                            lineWidth: isSelected ? 2 : 1
                        )
                )
                .frame(width: 96, height: 56)
                .clipped()

            Text(label(for: theme))
                .font(.caption2)
                .foregroundStyle(.white.opacity(0.9))
                .lineLimit(1)
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(
                    Color.white.opacity(isSelected ? 0.8 : 0.25),
                    lineWidth: isSelected ? 1.3 : 0.8
                )
        )
        .shadow(
            color: .black.opacity(0.35),
            radius: isSelected ? 14 : 8,
            y: 6
        )
    }

    private func label(for theme: GlassAppearanceManager.Theme) -> String {
        switch theme {
        case .darkTurquoise: return "Turquesa"
        case .lightBeige:    return "Beige"
        case .solar:         return "Solar"
        case .arctic:        return "Arctic"
        case .lava:          return "Lava"
        case .imageBackground: return "Imagen"
        }
    }

    // MARK: - SwiftData integration

    private func restorePersistedThemeIfNeeded() {
        guard
            let entity = storedThemes.first(where: { $0.id == "global-theme" }),
            let theme = GlassAppearanceManager.Theme(rawValue: entity.themeRawValue)
        else { return }

        manager.theme = theme
    }

    private func select(_ theme: GlassAppearanceManager.Theme) {
        withAnimation(.easeInOut(duration: 0.45)) {
            manager.theme = theme
        }
        persistTheme(theme)
    }

    private func persistTheme(_ theme: GlassAppearanceManager.Theme) {
        let id = "global-theme"

        if let existing = storedThemes.first(where: { $0.id == id }) {
            existing.themeRawValue = theme.rawValue
        } else {
            let entity = GlassThemeEntity(id: id, themeRawValue: theme.rawValue)
            modelContext.insert(entity)
        }

        do {
            try modelContext.save()
        } catch {
            #if DEBUG
            print("GlassKitPro – Error guardando tema:", error.localizedDescription)
            #endif
        }
    }
}
