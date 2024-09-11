import ComposableArchitecture
import Foundation

public struct SettingCore: Reducer {
    public init() {}
    public struct State: Equatable {
        public init() {}
    }

    public enum Action: Equatable {
        
    }

    public func reduce(into state: inout State, action: Action) -> Effect<Action> {}
}
