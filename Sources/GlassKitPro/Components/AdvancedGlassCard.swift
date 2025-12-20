import SwiftUI

public extension GlassKit {
    struct AdvancedGlassCard: View {
        var title: String = "Advanced Glass Card"
        var subtitle: String = "Efecto compuesto completo"
        @State private var tilt = CGSize.zero

        public var body: some View {
            ZStack {
                LiquidGlassMaterial().blur(radius: 22).scaleEffect(1.12)
                FracturedCrystalEffect().opacity(0.55).blur(radius: 4)

                DepthLayeredGlass {
                    VStack(alignment: .leading) {
                        Text(title).font(.title2.weight(.semibold))
                        Text(subtitle).font(.footnote)
                    }
                    .foregroundColor(.white)
                }
            }
            .frame(width: 360, height: 220)
            .clipShape(RoundedRectangle(cornerRadius: 26))
            .rotation3DEffect(.degrees(tilt.width * 0.6), axis: (0, 1, 0))
            .rotation3DEffect(.degrees(tilt.height * -0.6), axis: (1, 0, 0))
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { v in tilt = .init(width: (v.location.x - 180) / 18,
                                                   height: (v.location.y - 110) / 18) }
                    .onEnded { _ in withAnimation(.smooth(duration: 0.45)) { tilt = .zero } }
            )
        }
    }
}
