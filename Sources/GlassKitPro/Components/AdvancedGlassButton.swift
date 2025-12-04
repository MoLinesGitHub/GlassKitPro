import SwiftUI

extension GlassKit {
    struct AdvancedGlassButton: View {
        let title: String
        let icon: String
        @State private var ripple = false

        public var body: some View {
            Button {
                ripple = true
                Task { try? await Task.sleep(for: .seconds(0.4)); ripple = false }
            } label: {
                HStack(spacing: 10) {
                    Image(systemName: icon)
                        .font(.title3)
                        .padding(8)
                        .background(
                            Circle()
                                .fill(
                                    RadialGradient(
                                        colors: [.yellow.opacity(0.9), .orange.opacity(0.85)],
                                        center: .center,
                                        startRadius: 0,
                                        endRadius: 20
                                    )
                                )
                        )

                    Text(title)
                        .font(.footnote)
                        .textCase(.uppercase)
                        .foregroundStyle(.white.opacity(0.92))
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 18)
                .background(.ultraThinMaterial)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.white.opacity(0.4)))
                .overlay {
                    if ripple {
                        Circle()
                            .fill(Color.white.opacity(0.35))
                            .scaleEffect(ripple ? 2.4 : 0.1)
                            .opacity(ripple ? 0 : 1)
                            .animation(.easeOut(duration: 0.6), value: ripple)
                    }
                }
            }
        }
    }
}
