import SwiftUI

public enum BackgroundType {
    case clear
    case rain
    case snow
    case thunder
    case heatWave
    case heavySnow
    case miseBad
    case miseSoBad
    case miseTooBad
    case miseWorst
}

public extension BackgroundType {
    func toColors() -> [Color] {
        switch self {
        case .clear: return [
            DesignSystemAsset.BackgroundWeather.clear1.swiftUIColor,
            DesignSystemAsset.BackgroundWeather.clear2.swiftUIColor
        ]
        case .rain: return [
            DesignSystemAsset.BackgroundWeather.rain1.swiftUIColor,
            DesignSystemAsset.BackgroundWeather.rain2.swiftUIColor
        ]
        case .snow: return [
            DesignSystemAsset.BackgroundWeather.snow1.swiftUIColor,
            DesignSystemAsset.BackgroundWeather.snow2.swiftUIColor
        ]
        case .thunder: return [
            DesignSystemAsset.BackgroundWeather.thunder1.swiftUIColor,
            DesignSystemAsset.BackgroundWeather.thunder2.swiftUIColor
        ]
        case .heatWave: return [
            DesignSystemAsset.BackgroundWarning.heatWave1.swiftUIColor,
            DesignSystemAsset.BackgroundWarning.heatWave2.swiftUIColor
        ]
        case .heavySnow: return [
            DesignSystemAsset.BackgroundWarning.heavySnow1.swiftUIColor,
            DesignSystemAsset.BackgroundWarning.heavySnow2.swiftUIColor
        ]
        case .miseBad: return [
            DesignSystemAsset.BackgroundMise.bad1.swiftUIColor,
            DesignSystemAsset.BackgroundMise.bad2.swiftUIColor
        ]
        case .miseSoBad: return [
            DesignSystemAsset.BackgroundMise.soBad1.swiftUIColor,
            DesignSystemAsset.BackgroundMise.soBad2.swiftUIColor
        ]
        case .miseTooBad: return [
            DesignSystemAsset.BackgroundMise.tooBad1.swiftUIColor,
            DesignSystemAsset.BackgroundMise.tooBad2.swiftUIColor
        ]
        case .miseWorst: return [
            DesignSystemAsset.BackgroundMise.worst1.swiftUIColor,
            DesignSystemAsset.BackgroundMise.worst2.swiftUIColor
        ]
        }
    }
}
