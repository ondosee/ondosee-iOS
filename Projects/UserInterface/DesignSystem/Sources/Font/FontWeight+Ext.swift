import SwiftUI

public extension Font {
    static func regular(_ style: Font.OndoseeFontSystem, size: CGFloat.OndoseeFontStyle) -> Font {
        switch style {
        case .system: return .system(size: size.size, weight: .regular)
        case .freesentation: return DesignSystemFontFamily.Freesentation._4Regular.swiftUIFont(size: size.size)
        }
    }

    static func medium(_ style: Font.OndoseeFontSystem, size: CGFloat.OndoseeFontStyle) -> Font {
        switch style {
        case .system: return .system(size: size.size, weight: .medium)
        case .freesentation: return DesignSystemFontFamily.Freesentation._5Medium.swiftUIFont(size: size.size)
        }
    }

    static func bold(_ style: Font.OndoseeFontSystem, size: CGFloat.OndoseeFontStyle) -> Font {
        switch style {
        case .system: return .system(size: size.size, weight: .bold)
        case .freesentation: return DesignSystemFontFamily.Freesentation._7Bold.swiftUIFont(size: size.size)
        }
    }
}
