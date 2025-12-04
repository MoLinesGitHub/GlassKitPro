import SwiftUI

extension GlassKit {
    struct FrostedSidebarGlass: View {
        let sections = ["Inicio", "Panel", "Métricas", "Configuración"]

        public var body: some View {
            VStack(alignment: .leading, spacing: 14) {
                ForEach(sections, id: \.self) { s in
                    Text(s)
                        .padding(10)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                Spacer()
            }
            .frame(width: 220)
        }
}
    }