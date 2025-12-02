import SwiftUI

extension GlassKit {
// MARK: - 17. Crystal Metric Card
// ===============================================================

extension GlassKit {
    struct CrystalMetricCard: View {
        let title: String
        let value: String
        let subtitle: String?
        let trend: TrendDirection?
        let accentColor: Color

        @State private var animateValue = false
        @State private var shimmerOffset: CGFloat = -200

        enum TrendDirection {
            case up, down, neutral

            var color: Color {
                switch self {
                case .up: return .green
                case .down: return .red
                case .neutral: return .secondary
                }
}
