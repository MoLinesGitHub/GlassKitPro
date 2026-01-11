import SwiftUI

public extension GlassKit {
    struct LiquidFlowBackground: View {
        // MARK: Lifecycle

        public init() {}

        // MARK: Public

        public var body: some View {
            TimelineView(.animation) { timeline in
                ZStack {
                    WaveShape(phase: self.phase, strength: 22, frequency: 8)
                        .fill(Color.white.opacity(0.16)).blur(radius: 24)
                    WaveShape(phase: self.phase * 1.4, strength: 32, frequency: 6)
                        .fill(Color.white.opacity(0.12)).blur(radius: 30)
                }
                .ignoresSafeArea()
                .task(id: timeline.date) {
                    _ = self.updatePhase(date: timeline.date)
                }
            }
        }

        // MARK: Internal

        struct WaveShape: Shape {
            var phase: CGFloat
            var strength: CGFloat
            var frequency: CGFloat

            func path(in rect: CGRect) -> Path {
                var p = Path()
                let w = rect.width
                let h = rect.height
                p.move(to: .init(x: 0, y: h * 0.5))
                for x in stride(from: 0, through: w, by: 1) {
                    let r = x / w
                    let s = sin(r * self.frequency + self.phase)
                    let y = h * 0.5 + s * self.strength
                    p.addLine(to: .init(x: x, y: y))
                }
                p.addLine(to: .init(x: w, y: h))
                p.addLine(to: .init(x: 0, y: h))
                p.closeSubpath()
                return p
            }
        }

        func updatePhase(date _: Date) -> CGFloat {
            let sp: CGFloat = 0.045
            self.phase += sp
            return self.phase
        }

        // MARK: Private

        @State private var phase: CGFloat = 0
    }
}
