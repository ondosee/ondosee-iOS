import ComposableArchitecture
import SwiftUI
import WeeklyForecastFeature

@main
struct WeeklyForecastApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                WeeklyForecastView(
                    store: Store(
                        initialState: WeeklyForecastCore.State(),
                        reducer: {
                            WeeklyForecastCore()
                        }
                    )
                )
            }
        }
    }
}
