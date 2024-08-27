import SwiftUI

public extension Color {
    enum OndoseeColorSystem {
        case system(System)
        case components(Components)
        case mise(Mise)
    }

    static func ondosee(_ style: OndoseeColorSystem) -> Color {
        switch style {
        case let .system(colorable as OndoseeColorable),
            let .components(colorable as OndoseeColorable),
            let .mise(colorable as OndoseeColorable):
            return colorable.color
        }
    }
}
