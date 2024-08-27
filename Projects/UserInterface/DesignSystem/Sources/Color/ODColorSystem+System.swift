import SwiftUI

public extension Color.OndoseeColorSystem {
    enum System: OndoseeColorable {
        case background
        case primary
        case secondary
        case tertiary
        case warning
    }
}

public extension Color.OndoseeColorSystem.System {
    var color: Color {
        switch self {
        case .background: return DesignSystemAsset.System.background.swiftUIColor
        case .primary: return DesignSystemAsset.System.primary.swiftUIColor
        case .secondary: return DesignSystemAsset.System.secondary.swiftUIColor
        case .tertiary: return DesignSystemAsset.System.tertiary.swiftUIColor
        case .warning: return DesignSystemAsset.System.warning.swiftUIColor
        }
    }
}
