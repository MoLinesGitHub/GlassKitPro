import SwiftUI

public extension GlassKit {
    struct LiquidFlowBackground: View {
        @State private var phase: CGFloat = 0
        var body: some View {
            TimelineView(.animation) { timeline in
                let _ = updatePhase(date: timeline.date)
                ZStack {
                    WaveShape(phase: phase, strength:22, frequency:8)
                        .fill(Color.white.opacity(0.16)).blur(radius:24)
                    WaveShape(phase: phase*1.4, strength:32, frequency:6)
                        .fill(Color.white.opacity(0.12)).blur(radius:30)
                }
                .ignoresSafeArea()
            }
        }

        func updatePhase(date:Date)->CGFloat {
            let sp:CGFloat = 0.045
            phase += sp
            return phase
        }

        struct WaveShape: Shape {
            var phase: CGFloat
            var strength: CGFloat
            var frequency: CGFloat

            func path(in rect:CGRect)->Path {
                var p = Path()
                let w = rect.width
                let h = rect.height
                p.move(to:.init(x:0,y:h*0.5))
                for x in stride(from:0,through:w,by:1){
                    let r = x/w
                    let s = sin(r*frequency + phase)
                    let y = h*0.5 + s*strength
                    p.addLine(to:.init(x:x,y:y))
                }
                p.addLine(to:.init(x:w,y:h))
                p.addLine(to:.init(x:0,y:h))
                p.closeSubpath()
                return p
            }
        }
    }
}
