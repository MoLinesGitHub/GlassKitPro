import SwiftUI

public extension GlassKit {
    struct FracturedCrystalEffect: View {
        public var body: some View {
            ZStack {
                RadialGradient(
                    gradient: .init(colors: [
                        Color.blue.opacity(0.55),
                        Color.purple.opacity(0.35),
                        Color.clear,
                    ]),
                    center: .topLeading,
                    startRadius: 20,
                    endRadius: 240,
                )
                .blur(radius: 28)

                GeometryReader { geo in
                    let w = geo.size.width
                    let h = geo.size.height

                    Path { p in
                        p.move(to: .init(x: 0.1 * w, y: 0.2 * h))
                        p.addLine(to: .init(x: 0.4 * w, y: 0.05 * h))
                        p.addLine(to: .init(x: 0.9 * w, y: 0.1 * h))
                        p.addLine(to: .init(x: 0.95 * w, y: 0.45 * h))
                        p.addLine(to: .init(x: 0.8 * w, y: 0.9 * h))
                        p.addLine(to: .init(x: 0.3 * w, y: 0.85 * h))
                        p.closeSubpath()
                    }
                    .fill(
                        LinearGradient(
                            gradient: .init(colors: [
                                Color.white.opacity(0.45),
                                Color.gray.opacity(0.12),
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing,
                        ),
                    )
                    .blur(radius: 6)
                    .opacity(0.80)
                }
            }
            .compositingGroup()
            .blendMode(.screen)
        }
    }
}
