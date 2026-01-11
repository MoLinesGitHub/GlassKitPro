import SwiftUI

public extension GlassKit {
    struct CrystalParticles: View {
        // MARK: Public

        public var body: some View {
            ZStack {
                ForEach(self.particles) { p in
                    Circle()
                        .fill(Color.white.opacity(p.opacity))
                        .frame(width: p.size, height: p.size)
                        .position(x: p.x, y: p.y)
                }
            }
            .onReceive(Timer.publish(every: 0.016, on: .main, in: .common).autoconnect()) { _ in
                self.update()
            }
        }

        // MARK: Internal

        struct Particle: Identifiable {
            // MARK: Lifecycle

            init() {
                // Usar valores razonables por defecto para iPhone/iPad
                let screenWidth: CGFloat = 400
                let screenHeight: CGFloat = 800
                self.x = CGFloat.random(in: 0 ... screenWidth)
                self.y = screenHeight + CGFloat.random(in: 20 ... 120)
            }

            // MARK: Internal

            let id = UUID()
            var x: CGFloat
            var y: CGFloat
            var size = CGFloat.random(in: 2 ... 6)
            var opacity = CGFloat.random(in: 0.25 ... 0.9)
            var speed = CGFloat.random(in: 0.4 ... 1.2)
            var life: CGFloat = 0
        }

        func update() {
            for i in self.particles.indices {
                self.particles[i].y -= self.particles[i].speed
                self.particles[i].life += 1
                if self.particles[i].y < -40 { self.particles[i] = Particle() }
            }
        }

        // MARK: Private

        @State private var particles = (0 ..< 36).map { _ in Particle() }
    }
}
