import ComposableArchitecture
import SwiftUI

public struct WeeklyForecastView: View {
    let store: StoreOf<WeeklyForecastCore>

    public init(store: StoreOf<WeeklyForecastCore>) {
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
