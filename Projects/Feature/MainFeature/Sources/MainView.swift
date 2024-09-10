import ComposableArchitecture
import DesignSystem
import SwiftUI

public struct MainView: View {
    let store: StoreOf<MainCore>

    public init(store: StoreOf<MainCore>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                LinearGradient(
                    gradient: Gradient(
                        colors: viewStore.state.weatherType.toColors()
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
            }
            .ignoresSafeArea()
        }
    }
}
