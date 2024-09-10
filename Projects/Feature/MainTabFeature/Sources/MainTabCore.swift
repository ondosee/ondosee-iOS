import ComposableArchitecture
import MainFeature
import SettingFeature
import WeeklyForecastFeature

public struct MainTabCore: Reducer {
    public init() {}
    public struct State: Equatable {
        public var tabFlow: TabFlow = .main
        public var mainCore = MainCore.State()
        public var weeklyCore = WeeklyForecastCore.State()
        public var settingCore = SettingCore.State()

        public init() {}
    }

    public enum Action: Equatable {
        case changeTabFlow(TabFlow)
        case mainCore(MainCore.Action)
        case weeklyCore(WeeklyForecastCore.Action)
        case settingCore(SettingCore.Action)
    }

    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case let .changeTabFlow(flow):
            state.tabFlow = flow
            return .none

        default:
            return .none
        }
    }
}
