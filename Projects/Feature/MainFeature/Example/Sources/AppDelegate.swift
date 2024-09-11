import ComposableArchitecture
import SwiftUI
import MainFeature

@main
struct WeeklyForecastApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainView(
                    store: Store(
                        initialState: MainCore.State(),
                        reducer: {
                            MainCore()
                        }
                    )
                )
            }
        }
    }
}
