import SwiftUI

public enum GlassAnimations {

    public static var shimmer: Animation {
        .linear(duration: 1.4).repeatForever(autoreverses: false)
    }

    public static var pulse: Animation {
        .easeInOut(duration: 2).repeatForever(autoreverses: true)
    }

    public static var flip3D: Animation {
        .spring(response: 0.45, dampingFraction: 0.65, blendDuration: 0.1)
    }
}
