import SwiftUI

extension GlassKit {
    struct CrystalFloatingActionButton: View {
        let icon: String
        let label: String
        let action: () -> Void
        let accentColor: Color

        @State private var isPressed = false
        @State private var pulseAnimation = false
        @State private var rotationAngle: Double = 0

        init(
            icon: String,
            label: String = "",
            accentColor: Color = .blue,
            action: @escaping () -> Void
        ) {
            self.icon = icon
            self.label = label
            self.accentColor = accentColor
            self.action = action
        }

        public var body: some View {
            Button(action: {
                withAnimation(.easeInOut(duration: 0.1)) { isPressed = true }
                action()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation(.easeInOut(duration: 0.1)) { isPressed = false }
                }
            }) {
                HStack(spacing: 12) {
                    ZStack {
                        Circle()
                            .fill(accentColor.opacity(0.2))
                            .scaleEffect(pulseAnimation ? 1.3 : 1.0)
                            .opacity(pulseAnimation ? 0 : 1)

                        Image(systemName: icon)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.white, accentColor.opacity(0.9)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .rotationEffect(.degrees(rotationAngle))
                    }
                    .frame(width: 44, height: 44)

                    if !label.isEmpty {
                        Text(label)
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .opacity(isPressed ? 0.7 : 1.0)
                    }
                }
                .padding(.horizontal, label.isEmpty ? 0 : 14)
                .padding(.vertical, 12)
            }
            .background {
                ZStack {
                    Capsule().fill(.thickMaterial)
                    Capsule()
                        .fill(
                            LinearGradient(
                                colors: [
                                    .white.opacity(isPressed ? 0.3 : 0.15),
                                    accentColor.opacity(isPressed ? 0.4 : 0.2),
                                    .white.opacity(isPressed ? 0.1 : 0.05),
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    Capsule()
                        .strokeBorder(accentColor.opacity(0.5), lineWidth: 1.3)
                }
            }
            .scaleEffect(isPressed ? 0.95 : 1.0)
            .shadow(color: accentColor.opacity(0.4), radius: isPressed ? 8 : 16, y: isPressed ? 4 : 8)
            .onAppear {
                withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                    pulseAnimation = true
                }
                withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
                    rotationAngle = 360
                }
            }
        }
    }
}

// ===============================================================
