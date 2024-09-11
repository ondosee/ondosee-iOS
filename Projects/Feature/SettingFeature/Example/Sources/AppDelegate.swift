import ComposableArchitecture
import SwiftUI
import SettingFeature

@main
struct WeeklyForecastApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SettingView(
                    store: Store(
                        initialState: SettingCore.State(),
                        reducer: {
                            SettingCore()
                        }
                    )
                )
            }
        }
    }
}

