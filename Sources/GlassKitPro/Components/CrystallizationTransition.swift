import SwiftUI

public extension GlassKit {
    struct CrystallizationTransition: View {
        // MARK: Public

        public var body: some View {
            ZStack {
                LiquidGlassMaterial()
                    .clipShape(RoundedRectangle(cornerRadius: 28))

                RoundedRectangle(cornerRadius: 28)
                    .fill(
                        LinearGradient(
                            colors: [.black.opacity(0.4), .black.opacity(0.95)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing,
                        ),
                    )
                    .opacity(self.crystal ? 1 : 0)
                    .blur(radius: self.crystal ? 28 : 0)
                    .mask(
                        RadialGradient(
                            gradient: .init(colors: [.black, .clear]),
                            center: .center,
                            startRadius: self.crystal ? 240 : 0,
                            endRadius: self.crystal ? 0 : 240,
                        ),
                    )
                    .animation(.smooth(duration: 1.2), value: self.crystal)
            }
            .onTapGesture { self.crystal.toggle() }
        }

        // MARK: Private

        @State private var crystal = false
    }
}
