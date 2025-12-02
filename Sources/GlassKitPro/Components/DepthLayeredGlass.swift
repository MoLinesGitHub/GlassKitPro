import SwiftUI

extension GlassKit {
    struct DepthLayeredGlass<Content: View>: View {
        @ViewBuilder var content: () -> Content
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 26)
                    .fill(.ultraThinMaterial)
                    .blur(radius: 22)
                    .scaleEffect(1.12)
                    .opacity(0.55)

                RoundedRectangle(cornerRadius: 26)
                    .fill(
                        LinearGradient(
                            colors: [.white.opacity(0.08), .white.opacity(0.02)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .blur(radius: 12)
                    .scaleEffect(1.05)
                    .opacity(0.45)

                content()
                    .padding(16)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                    .overlay(
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color.white.opacity(0.35), lineWidth: 1.2)
                    )
            }
        }
    }
}
