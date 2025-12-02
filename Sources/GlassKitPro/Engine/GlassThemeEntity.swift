import Foundation
import SwiftData

/// Modelo SwiftData para persistir el tema seleccionado de GlassKit.
@Model
public final class GlassThemeEntity {
    @Attribute(.unique) public var id: String
    public var themeRawValue: String

    public init(id: String = "global-theme", themeRawValue: String) {
        self.id = id
        self.themeRawValue = themeRawValue
    }
}
