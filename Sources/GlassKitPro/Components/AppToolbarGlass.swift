import SwiftUI

public extension GlassKit {
    struct AppToolbarGlass: View {
        let icons = ["house.fill","bolt.fill","chart.bar.fill","gearshape.fill"]
        var body: some View {
            HStack(spacing:28) {
                ForEach(icons, id:\.self) { icon in
                    Image(systemName:icon)
                        .font(.title3)
                        .frame(width:50,height:50)
                        .background(.thinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius:16))
                }
            }
            .padding()
        }
    }
}
