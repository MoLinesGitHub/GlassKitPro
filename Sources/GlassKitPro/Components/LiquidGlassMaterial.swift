import SwiftUI

public extension GlassKit {
    struct LiquidGlassMaterial: View {
        // MARK: Public

        public init() {}

        public var body: some View {
            TimelineView(.animation) { timeline in
                let now = timeline.date.timeIntervalSinceReferenceDate
                let shift = sin(now / 2) * 0.15
                ZStack {
                    AngularGradient(
                        gradient: .init(colors: [
                            Color.blue.opacity(0.65),
                            Color.cyan.opacity(0.65),
                            Color.purple.opacity(0.65),
                            Color.pink.opacity(0.65),
                        ]),
                        center: .center,
                        angle: .degrees((shift * 60).truncatingRemainder(dividingBy: 360)),
                    )
                    .blur(radius: 40)

                    RadialGradient(
                        gradient: .init(colors: [
                            Color.white.opacity(0.20), Color.clear,
                        ]),
                        center: .topLeading,
                        startRadius: 20,
                        endRadius: 260,
                    )
                }
            }
        }

        // MARK: Private

        @State private var t: CGFloat = 0
    }
}
