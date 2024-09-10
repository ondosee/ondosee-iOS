import ComposableArchitecture
import Foundation
import DesignSystem

public struct WeeklyForecastCore: Reducer {
    public init() {}
    public struct State: Equatable {
        var weatherType: BackgroundType = .clear
        public init() {}
    }

    public enum Action: Equatable {
        case changeWeatherType(BackgroundType)
    }

    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case let .changeWeatherType(type):
            state.weatherType = type
            return .none
        }
    }
}
