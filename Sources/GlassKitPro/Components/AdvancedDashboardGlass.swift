import SwiftUI

extension GlassKit {
    struct AdvancedDashboardGlass: View {
        let items = ["Velocidad", "CPU", "RAM", "Latencia"]

        public var body: some View {
            VStack(spacing: 18) {
                ForEach(items, id: \.self) { item in
                    HStack {
                        Text(item).foregroundStyle(.white.opacity(0.95))
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 28).fill(.thinMaterial))
        }
    }
}
