import SwiftUI

public extension GlassKit {
    struct CrystallizationTransition: View {
        @State private var crystal = false

        var body: some View {
            ZStack {
                LiquidGlassMaterial()
                    .clipShape(RoundedRectangle(cornerRadius: 28))

                RoundedRectangle(cornerRadius: 28)
                    .fill(
                        LinearGradient(
                            colors: [.black.opacity(0.4), .black.opacity(0.95)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .opacity(crystal ? 1 : 0)
                    .blur(radius: crystal ? 28 : 0)
                    .mask(
                        RadialGradient(
                            gradient: .init(colors: [.black, .clear]),
                            center: .center,
                            startRadius: crystal ? 240 : 0,
                            endRadius: crystal ? 0 : 240
                        )
                    )
                    .animation(.smooth(duration: 1.2), value: crystal)
            }
            .onTapGesture { crystal.toggle() }
        }
}
    }