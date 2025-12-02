import SwiftUI
import SwiftData
import GlassKitPro

@main
struct GlassKitProDemoApp: App {
    @State private var manager = GlassAppearanceManager()

    var body: some Scene {
        WindowGroup {
            GlassKitDemoContainer(manager: manager)
                .modelContainer(for: GlassThemeEntity.self)
        }
    }
}
