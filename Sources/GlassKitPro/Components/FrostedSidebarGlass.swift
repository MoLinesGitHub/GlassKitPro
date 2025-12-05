import SwiftUI

public extension GlassKit {
    struct FrostedSidebarGlass: View {
        // MARK: Public

        public var body: some View {
            VStack(alignment: .leading, spacing: 14) {
                ForEach(self.sections, id: \.self) { s in
                    Text(s)
                        .padding(10)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                Spacer()
            }
            .frame(width: 220)
        }

        // MARK: Internal

        let sections = ["Inicio", "Panel", "Métricas", "Configuración"]
    }
}
