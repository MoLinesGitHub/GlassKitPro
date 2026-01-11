import SwiftUI

// CrystalKit Pro Panel (mini-showcase avanzado)
// ===============================================================

struct CrystalKitProPanel: View {
    // MARK: Internal

    let scrollTo: (String) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "sparkles")
                    .foregroundStyle(.white)
                Text("CrystalKit Pro")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.white.opacity(0.95))
                Spacer()
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    self.proButton(
                        title: "LiquidCard",
                        preview: GlassKit.CrystalLiquidCard(
                            title: "Demo",
                            accentColor: .cyan,
                        ) {
                            Text("…")
                                .opacity(0)
                        }
                        .frame(width: 120, height: 70),
                        anchor: "liquid",
                    )

                    self.proButton(
                        title: "FAB",
                        preview: GlassKit.CrystalFloatingActionButton(
                            icon: "plus",
                            label: "",
                            accentColor: .mint,
                            action: {},
                        )
                        .frame(width: 80, height: 70),
                        anchor: "fab",
                    )

                    self.proButton(
                        title: "NavBar",
                        preview: GlassKit.CrystalNavigationBar(
                            title: "Demo",
                            subtitle: "Glass",
                            leadingAction: nil,
                            trailingAction: nil,
                            leadingIcon: nil,
                            trailingIcon: "gearshape",
                        )
                        .frame(width: 160, height: 60),
                        anchor: "navbar",
                    )

                    self.proButton(
                        title: "MetricCard",
                        preview: GlassKit.CrystalMetricCard(
                            title: "Value",
                            value: "42",
                            subtitle: "+8%",
                            trend: .up,
                            accentColor: .green,
                        )
                        .frame(width: 140, height: 70),
                        anchor: "metric",
                    )
                }
                .padding(.horizontal, 4)
            }
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 22)
                .fill(.ultraThickMaterial),
        )
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(Color.white.opacity(0.28), lineWidth: 1),
        )
        .shadow(color: .black.opacity(0.4), radius: 24, y: 16)
        .padding(.horizontal)
    }

    // MARK: Private

    private func proButton(
        title: String,
        preview: some View,
        anchor: String,
    ) -> some View {
        Button {
            self.scrollTo(anchor)
        } label: {
            VStack(spacing: 6) {
                preview
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.white.opacity(0.45), lineWidth: 1),
                    )
                    .shadow(color: .black.opacity(0.35), radius: 8, y: 4)

                Text(title)
                    .font(.caption2)
                    .foregroundStyle(.white.opacity(0.9))
            }
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.ultraThinMaterial),
            )
        }
        .buttonStyle(.plain)
    }
}

// ===============================================================
// MARK: - 14. Crystal Liquid Card
