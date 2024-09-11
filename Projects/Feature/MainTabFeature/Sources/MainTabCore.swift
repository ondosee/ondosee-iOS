import ComposableArchitecture
import MainFeature
import SettingFeature
import WeeklyForecastFeature

public struct MainTabCore: Reducer {
    public init() {}
    public struct State: Equatable {
        var tabFlow: TabFlow = .main
        var mainCore = MainCore.State()
        var weeklyCore = WeeklyForecastCore.State()
        var settingCore = SettingCore.State()
        public init() {}
    }

    public enum Action {
        case changeTabFlow(TabFlow)
        case mainCore(MainCore.Action)
        case weeklyCore(WeeklyForecastCore.Action)
        case settingCore(SettingCore.Action)
    }

    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .changeTabFlow(flow):
                state.tabFlow = flow
                return .none

            default:
                return .none
            }
        }
    }
}
