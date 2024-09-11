import ComposableArchitecture
import SwiftUI
import MainTabFeature

public struct RootView: View {
    private let store: StoreOf<RootCore>

    public init(store: StoreOf<RootCore>) {
        self.store = store
    }

    public var body: some View {
        SwitchStore(store) {
            switch $0 {
            case .mainTab:
                CaseLet(/RootCore.State.mainTab, action: RootCore.Action.mainTabCore) { store in
                    MainTabView(store: store)
                }
            }
        }
    }
}
