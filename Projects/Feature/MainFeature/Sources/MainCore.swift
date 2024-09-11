import ComposableArchitecture
import Foundation

public struct MainCore: Reducer {
    public init() {}
    public struct State: Equatable {
        public init() {}
    }

    public enum Action: Equatable {}

    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            default:
                return .none
            }
        }
    }
}
