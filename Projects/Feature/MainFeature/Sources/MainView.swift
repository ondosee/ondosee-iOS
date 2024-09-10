import ComposableArchitecture
import DesignSystem
import SwiftUI

public struct MainView: View {
    let store: StoreOf<MainCore>

    public init(store: StoreOf<MainCore>) {
        self.store = store
    }

    public var body: some View {
        Text("Main View")
    }
}
