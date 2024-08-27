import SwiftUI

public extension Color.OndoseeColorSystem {
    enum Components: OndoseeColorable {
        case rain
        case snow
    }
}

public extension Color.OndoseeColorSystem.Components {
    var color: Color {
        switch self {
        case .rain: return DesignSystemAsset.Components.rain.swiftUIColor
        case .snow: return DesignSystemAsset.Components.snow.swiftUIColor
        }
    }
}
