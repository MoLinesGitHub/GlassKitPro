import SwiftUI

public extension GlassKit {
    struct CrystalFloatingActionButton: View {
        // MARK: Lifecycle

        init(
            icon: String,
            label: String = "",
            accentColor: Color = .blue,
            action: @escaping () -> Void,
        ) {
            self.icon = icon
            self.label = label
            self.accentColor = accentColor
            self.action = action
        }

        // MARK: Public

        public var body: some View {
            Button(action: {
                withAnimation(.easeInOut(duration: 0.1)) { self.isPressed = true }
                self.action()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation(.easeInOut(duration: 0.1)) { self.isPressed = false }
                }
            }) {
                HStack(spacing: 12) {
                    ZStack {
                        Circle()
                            .fill(self.accentColor.opacity(0.2))
                            .scaleEffect(self.pulseAnimation ? 1.3 : 1.0)
                            .opacity(self.pulseAnimation ? 0 : 1)

                        Image(systemName: self.icon)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.white, self.accentColor.opacity(0.9)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing,
                                ),
                            )
                            .rotationEffect(.degrees(self.rotationAngle))
                    }
                    .frame(width: 44, height: 44)

                    if !self.label.isEmpty {
                        Text(self.label)
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .opacity(self.isPressed ? 0.7 : 1.0)
                    }
                }
                .padding(.horizontal, self.label.isEmpty ? 0 : 14)
                .padding(.vertical, 12)
            }
            .background {
                ZStack {
                    Capsule().fill(.thickMaterial)
                    Capsule()
                        .fill(
                            LinearGradient(
                                colors: [
                                    .white.opacity(self.isPressed ? 0.3 : 0.15),
                                    self.accentColor.opacity(self.isPressed ? 0.4 : 0.2),
                                    .white.opacity(self.isPressed ? 0.1 : 0.05)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing,
                            ),
                        )
                    Capsule()
                        .strokeBorder(self.accentColor.opacity(0.5), lineWidth: 1.3)
                }
            }
            .scaleEffect(self.isPressed ? 0.95 : 1.0)
            .shadow(color: self.accentColor.opacity(0.4), radius: self.isPressed ? 8 : 16, y: self.isPressed ? 4 : 8)
            .onAppear {
                withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                    self.pulseAnimation = true
                }
                withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
                    self.rotationAngle = 360
                }
            }
        }

        // MARK: Internal

        let icon: String
        let label: String
        let action: () -> Void
        let accentColor: Color

        // MARK: Private

        @State private var isPressed = false
        @State private var pulseAnimation = false
        @State private var rotationAngle: Double = 0
    }
}

// ===============================================================
