import SwiftUI

struct GlassKitDemoContainer: View {
    @State private var manager = GlassAppearanceManager()

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(spacing: 18) {
                    GlassKitThemeControlCenter(manager: manager)
                    CrystalKitProPanel { anchor in
                        withAnimation(.smooth(duration:0.6)) {
                            proxy.scrollTo(anchor, anchor: .center)
                        }
                    }

                    Group {
                        GlassKit.GlassHeroBanner().id("hero")
                        GlassKit.AdvancedGlassCard().id("card")
                        GlassKit.AdvancedDashboardGlass().id("dashboard")
                        GlassKit.DynamicGlassCarousel().id("carousel")
                        GlassKit.AppToolbarGlass().id("toolbar")
                    }
                }
                .padding()
            }
            .background(manager.backgroundView)
        }
    }
}
