import SwiftUI

public extension GlassKit {
    struct AdvancedGlassButton: View {
        // MARK: Public

        public var body: some View {
            Button {
                self.ripple = true
                Task { try? await Task.sleep(for: .seconds(0.4))
                    self.ripple = false
                }
            } label: {
                HStack(spacing: 10) {
                    Image(systemName: self.icon)
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

                    Text(self.title)
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
                    if self.ripple {
                        Circle()
                            .fill(Color.white.opacity(0.35))
                            .scaleEffect(self.ripple ? 2.4 : 0.1)
                            .opacity(self.ripple ? 0 : 1)
                            .animation(.easeOut(duration: 0.6), value: self.ripple)
                    }
                }
            }
        }

        // MARK: Internal

        let title: String
        let icon: String

        // MARK: Private

        @State private var ripple = false
    }
}
