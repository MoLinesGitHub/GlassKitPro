import SwiftUI

extension GlassKit {
    struct DynamicGlassCarousel: View {
        let items = (1...8).map { "Tarjeta \($0)" }

        var body: some View {
            ScrollView(.horizontal, showsIndicators:false) {
                HStack(spacing:22) {
                    ForEach(items, id:\.self) { item in
                        Text(item)
                            .frame(width:200, height:150)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius:24))
                    }
                }
                .padding()
            }
        }
}
