import GlassKitPro
import SwiftData
import SwiftUI

@main
struct GlassKitProDemoApp: App {
    // MARK: Internal

    var body: some Scene {
        WindowGroup {
            GlassKitDemoContainer(manager: self.manager)
                .modelContainer(for: GlassThemeEntity.self)
        }
    }

    // MARK: Private

    @State private var manager = GlassAppearanceManager()
}
