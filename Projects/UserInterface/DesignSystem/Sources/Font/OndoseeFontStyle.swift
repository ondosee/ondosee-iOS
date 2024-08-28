import Foundation

public extension CGFloat {
    enum OndoseeFontStyle {
        case title1
        case title2
        case title3
        case text1
        case text2
        case text3
        case caption
    }
}

public extension CGFloat.OndoseeFontStyle {
    var size: CGFloat {
        switch self {
        case .title1: return 30
        case .title2: return 25
        case .title3: return 20
        case .text1: return 17
        case .text2: return 15
        case .text3: return 13
        case .caption: return 10
        }
    }
}
