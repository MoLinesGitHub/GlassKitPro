import SwiftUI

public extension GlassKit {
    struct CrystalLiquidCard: View {
        // MARK: Lifecycle

        public init(
            title: String,
            accentColor: Color = .blue,
            intensity: Double = 0.7,
            @ViewBuilder content: () -> some View
        ) {
            self.title = title
            self.content = AnyView(content())
            self.accentColor = accentColor
            self.intensity = intensity
        }

        // MARK: Public

        public var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(self.title)
                            .font(.title2.weight(.semibold))
                            .foregroundStyle(.primary)

                        Capsule()
                            .fill(
                                LinearGradient(
                                    colors: [
                                        self.accentColor.opacity(0.6),
                                        self.accentColor.opacity(0.8),
                                        self.accentColor.opacity(0.4),
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing,
                                ),
                            )
                            .frame(height: 3)
                            .frame(maxWidth: 60)
                            .animation(.easeInOut(duration: 0.6), value: self.pressedState)
                    }
                    Spacer()
                }

                self.content
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
                                    .white.opacity(self.pressedState ? 0.15 : 0.08),
                                    .white.opacity(self.pressedState ? 0.05 : 0.02),
                                    self.accentColor.opacity(self.pressedState ? 0.12 : 0.06),
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing,
                            ),
                        )

                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(
                            LinearGradient(
                                colors: [
                                    self.accentColor.opacity(self.intensity),
                                    .white.opacity(0.4),
                                    self.accentColor.opacity(self.intensity * 0.8),
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing,
                            ),
                            lineWidth: 1.2,
                        )
                }
            }
            .scaleEffect(self.pressedState ? 0.985 : 1.0)
            .shadow(color: self.accentColor.opacity(0.35), radius: 12, y: 8)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.15)) {
                    self.pressedState = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    withAnimation(.easeInOut(duration: 0.15)) {
                        self.pressedState = false
                    }
                }
            }
        }

        // MARK: Internal

        let title: String
        let content: AnyView
        let accentColor: Color
        let intensity: Double

        // MARK: Private

        @State private var pressedState: Bool = false
        @State private var liquidFlow: Double = 0
    }
}
