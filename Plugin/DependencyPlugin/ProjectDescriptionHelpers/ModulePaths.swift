import Foundation

public enum ModulePaths {
    case feature(Feature)
    case domain(Domain)
    case core(Core)
    case shared(Shared)
    case userInterface(UserInterface)
}

extension ModulePaths: ModularTargetPathConvertable {
    public func targetName(type: ModularTargetType) -> String {
        switch self {
        case let .feature(module as any ModularTargetPathConvertable),
            let .domain(module as any ModularTargetPathConvertable),
            let .core(module as any ModularTargetPathConvertable),
            let .shared(module as any ModularTargetPathConvertable),
            let .userInterface(module as any ModularTargetPathConvertable):
            return module.targetName(type: type)
        }
    }
}

public extension ModulePaths {
    enum Feature: String, ModularTargetPathConvertable {
        case BaseFeature
        case MainTabFeature
        case MainFeature
        case WeeklyForecastFeature
        case SettingFeature
        case RootFeature
    }
}

public extension ModulePaths {
    enum Domain: String, ModularTargetPathConvertable {
        case BaseDomain
    }
}

public extension ModulePaths {
    enum Core: String, ModularTargetPathConvertable {
        case Networking
    }
}

public extension ModulePaths {
    enum Shared: String, ModularTargetPathConvertable {
        case GlobalThirdPartyLibrary
    }
}

public extension ModulePaths {
    enum UserInterface: String, ModularTargetPathConvertable {
        case DesignSystem
    }
}

public enum ModularTargetType: String {
    case interface = "Interface"
    case sources = ""
    case testing = "Testing"
    case unitTest = "Tests"
    case example = "Example"
}

public protocol ModularTargetPathConvertable {
    func targetName(type: ModularTargetType) -> String
}

public extension ModularTargetPathConvertable where Self: RawRepresentable {
    func targetName(type: ModularTargetType) -> String {
        "\(self.rawValue)\(type.rawValue)"
    }
}

// MARK: - For DI
extension ModulePaths.Feature: CaseIterable {}
extension ModulePaths.Domain: CaseIterable {}
