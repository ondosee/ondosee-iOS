import SwiftUI

public extension Color.OndoseeColorSystem {
    enum Mise: OndoseeColorable {
        case veryGood
        case soGood
        case good
        case soso
        case bad
        case soBad
        case tooBad
        case worst
    }
}

public extension Color.OndoseeColorSystem.Mise {
    var color: Color {
        switch self {
        case .veryGood: return DesignSystemAsset.ComponentMise.veryGood.swiftUIColor
        case .soGood: return DesignSystemAsset.ComponentMise.soGood.swiftUIColor
        case .good: return DesignSystemAsset.ComponentMise.good.swiftUIColor
        case .soso: return DesignSystemAsset.ComponentMise.soso.swiftUIColor
        case .bad: return DesignSystemAsset.ComponentMise.bad.swiftUIColor
        case .soBad: return DesignSystemAsset.ComponentMise.soBad.swiftUIColor
        case .tooBad: return DesignSystemAsset.ComponentMise.tooBad.swiftUIColor
        case .worst: return DesignSystemAsset.ComponentMise.worst.swiftUIColor
        }
    }
}
