import SwiftUI

public extension GlassKit {
    struct AdvancedDashboardGlass: View {
        // MARK: Lifecycle

        public init() {}

        // MARK: Public

        public var body: some View {
            VStack(spacing: 18) {
                ForEach(self.items, id: \.self) { item in
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

        // MARK: Internal

        let items = ["Velocidad", "CPU", "RAM", "Latencia"]
    }
}
