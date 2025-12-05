import SwiftUI

public extension GlassKit {
    struct CrystalNavigationBar: View {
        // MARK: Public

        public var body: some View {
            HStack {
                if let leadingIcon, let leadingAction {
                    Button(action: leadingAction) {
                        Image(systemName: leadingIcon)
                            .font(.system(size: 20, weight: .medium))
                            .foregroundStyle(.primary)
                            .frame(width: 44, height: 44)
                            .background(.ultraThinMaterial, in: Circle())
                    }
                }

                Spacer()

                VStack(spacing: 2) {
                    Text(self.title)
                        .font(.title2.weight(.bold))
                        .foregroundStyle(.primary)
                        .scaleEffect(self.titleAnimation ? 1.05 : 1.0)

                    if let subtitle {
                        Text(subtitle)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }

                Spacer()

                if let trailingIcon, let trailingAction {
                    Button(action: trailingAction) {
                        Image(systemName: trailingIcon)
                            .font(.system(size: 20, weight: .medium))
                            .foregroundStyle(.primary)
                            .frame(width: 44, height: 44)
                            .background(.ultraThinMaterial, in: Circle())
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.regularMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
                    )
            )
            .onAppear {
                withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                    self.titleAnimation = true
                }
            }
        }

        // MARK: Internal

        let title: String
        let subtitle: String?
        let leadingAction: (() -> Void)?
        let trailingAction: (() -> Void)?
        let leadingIcon: String?
        let trailingIcon: String?

        // MARK: Private

        @State private var titleAnimation = false
    }
}
