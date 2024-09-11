import ComposableArchitecture
import Foundation
import MainTabFeature

public struct RootCore: Reducer {
    public init() {}
    public enum State: Equatable {
        case mainTab(MainTabCore.State)

        public init() { self = .mainTab(.init()) }
    }

    public enum Action {
        case mainTabCore(MainTabCore.Action)
    }

    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .mainTabCore:
                state = .mainTab(.init())
                return .none
            }
        }
    }
}
