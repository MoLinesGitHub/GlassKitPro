import Foundation
import SwiftData

/// Modelo SwiftData para persistir el tema seleccionado de GlassKit.
@Model
public final class GlassThemeEntity {
    // MARK: Lifecycle

    public init(id: String = "global-theme", themeRawValue: String) {
        self.id = id
        self.themeRawValue = themeRawValue
    }

    // MARK: Public

    @Attribute(.unique) public var id: String
    public var themeRawValue: String
}
