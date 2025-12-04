import SwiftUI

extension GlassKit {
    struct GlassHeroBanner: View {
        @State private var shine = false
        public var body: some View {
            ZStack {
                LiquidGlassMaterial().blur(radius: 28)
                VStack {
                    Text("Crystal UI Engine").font(.system(size: 34, weight: .bold))
                    Text("Efectos avanzados para iOS 26")
                        .foregroundColor(.white.opacity(0.85))
                }
            }
            .frame(height: 240)
            .clipShape(RoundedRectangle(cornerRadius: 32))
        }
}
    }