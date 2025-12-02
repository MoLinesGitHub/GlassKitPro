import SwiftUI

extension GlassKit {
    struct CrystalParticles: View {
        @State private var particles = (0..<36).map { _ in Particle() }

        var body: some View {
            ZStack {
                ForEach(particles) { p in
                    Circle()
                        .fill(Color.white.opacity(p.opacity))
                        .frame(width:p.size, height:p.size)
                        .position(x:p.x, y:p.y)
                }
            }
            .onReceive(Timer.publish(every:0.016,on:.main,in:.common).autoconnect()) { _ in
                update()
            }
        }

        func update() {
            for i in particles.indices {
                particles[i].y -= particles[i].speed
                particles[i].life += 1
                if particles[i].y < -40 { particles[i] = Particle() }
            }
        }

        struct Particle: Identifiable {
            static let screen = UIScreen.main.bounds
            let id = UUID()
            var x = CGFloat.random(in: 0...screen.width)
            var y = screen.height + CGFloat.random(in:20...120)
            var size = CGFloat.random(in:2...6)
            var opacity = CGFloat.random(in:0.25...0.9)
            var speed = CGFloat.random(in:0.4...1.2)
            var life: CGFloat = 0
        }
    }
}
