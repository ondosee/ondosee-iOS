import ComposableArchitecture
import Foundation
import DesignSystem

public struct MainCore: Reducer {
    public init() {}
    public struct State: Equatable {
        var weatherType: BackgroundType = .clear
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
