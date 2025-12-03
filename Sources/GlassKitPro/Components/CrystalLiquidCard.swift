import SwiftUI

extension GlassKit {
    struct CrystalLiquidCard: View {
        let title: String
        let content: AnyView
        let accentColor: Color
        let intensity: Double

        @State private var pressedState: Bool = false
        @State private var liquidFlow: Double = 0

        init<Content: View>(
            title: String,
            accentColor: Color = .blue,
            intensity: Double = 0.7,
            @ViewBuilder content: () -> Content
        ) {
            self.title = title
            self.content = AnyView(content())
            self.accentColor = accentColor
            self.intensity = intensity
        }

        var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(title)
                            .font(.title2.weight(.semibold))
                            .foregroundStyle(.primary)

                        Capsule()
                            .fill(
                                LinearGradient(
                                    colors: [
                                        accentColor.opacity(0.6),
                                        accentColor.opacity(0.8),
                                        accentColor.opacity(0.4),
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(height: 3)
                            .frame(maxWidth: 60)
                            .animation(.easeInOut(duration: 0.6), value: pressedState)
                    }
                    Spacer()
                }

                content
            }
            .padding(.all, 20)
            .background {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.ultraThinMaterial)

                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(
                                colors: [
                                    .white.opacity(pressedState ? 0.15 : 0.08),
                                    .white.opacity(pressedState ? 0.05 : 0.02),
                                    accentColor.opacity(pressedState ? 0.12 : 0.06),
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )

                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(
                            LinearGradient(
                                colors: [
                                    accentColor.opacity(intensity),
                                    .white.opacity(0.4),
                                    accentColor.opacity(intensity * 0.8),
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1.2
                        )
                }
            }
            .scaleEffect(pressedState ? 0.985 : 1.0)
            .shadow(color: accentColor.opacity(0.35), radius: 12, y: 8)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.15)) {
                    pressedState = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    withAnimation(.easeInOut(duration: 0.15)) {
                        pressedState = false
                    }
                }
            }
        }
    }
}
