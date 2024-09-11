import SwiftUI

public struct ODIcon: View {
    var icon: Icon
    var renderingMode: Image.TemplateRenderingMode
    var width: CGFloat?
    var height: CGFloat?

    public init(
        _ icon: Icon,
        renderingMode: Image.TemplateRenderingMode = .template,
        width: CGFloat? = 24,
        height: CGFloat? = 24
    ) {
        self.icon = icon
        self.renderingMode = renderingMode
        self.width = width
        self.height = height
    }

    public enum Icon: CaseIterable {
        case home
        case setting
        case calendar
    }

    public var body: some View {
        iconToImage()
            .resizable()
            .renderingMode(renderingMode)
            .frame(width: width, height: height)
    }

    private func iconToImage() -> Image {
        switch icon {
        case .home: return DesignSystemAsset.Icons.home.swiftUIImage
        case .setting: return DesignSystemAsset.Icons.setting.swiftUIImage
        case .calendar: return DesignSystemAsset.Icons.calendar.swiftUIImage
        }
    }
}
