import SwiftUI

public extension GlassKit {
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
                case .up: .green
                case .down: .red
                case .neutral: .secondary
                }
            }

            var icon: String {
                switch self {
                case .up: "arrow.up"
                case .down: "arrow.down"
                case .neutral: "minus"
                }
            }
        }

        init(
            title: String,
            value: String,
            subtitle: String? = nil,
            trend: TrendDirection? = nil,
            accentColor: Color = .blue
        ) {
            self.title = title
            self.value = value
            self.subtitle = subtitle
            self.trend = trend
            self.accentColor = accentColor
        }

        public var body: some View {
            VStack(alignment: .leading, spacing: 12) {
                Text(title)
                    .font(.caption)
                    .foregroundStyle(.secondary)

                HStack(alignment: .firstTextBaseline) {
                    Text(value)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundStyle(.primary)
                        .opacity(animateValue ? 1 : 0)
                        .offset(y: animateValue ? 0 : 10)

                    if let trend {
                        Image(systemName: trend.icon)
                            .font(.caption)
                            .foregroundStyle(trend.color)
                    }

                    Spacer()
                }

                if let subtitle {
                    Text(subtitle)
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(.ultraThinMaterial)
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .strokeBorder(accentColor.opacity(0.3), lineWidth: 1)
                    }
            }
            .onAppear {
                withAnimation(.easeOut(duration: 0.6)) {
                    animateValue = true
                }
            }
        }
    }
}
