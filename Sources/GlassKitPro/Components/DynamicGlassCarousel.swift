import SwiftUI

public extension GlassKit {
    struct DynamicGlassCarousel<Data, Content>: View where Data: RandomAccessCollection, Data.Element: Identifiable, Content: View {
        // MARK: Lifecycle

        public init(_ data: Data, @ViewBuilder content: @escaping (Data.Element) -> Content) {
            self.data = data
            self.content = content
        }

        // MARK: Public

        public let data: Data
        @ViewBuilder public let content: (Data.Element) -> Content

        public var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 22) {
                    ForEach(self.data) { element in
                        self.content(element)
                    }
                }
                .padding()
            }
        }
    }
}

// MARK: - Convenience for Strings

public extension GlassKit.DynamicGlassCarousel where Data == [IdentifiedString], Content == TextCard {
    init(items: [String] = (1...8).map { "Tarjeta \($0)" }) {
        let identified = items.enumerated().map { IdentifiedString(id: $0.offset, value: $0.element) }
        self.init(identified) { element in
            TextCard(text: element.value)
        }
    }
}

// MARK: - Helper Types

public struct IdentifiedString: Identifiable, Hashable {
    public let id: Int
    public let value: String
}

public struct TextCard: View {
    // MARK: Lifecycle

    public init(text: String) { self.text = text }

    // MARK: Public

    public let text: String

    public var body: some View {
        Text(self.text)
            .frame(width: 200, height: 150)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}
