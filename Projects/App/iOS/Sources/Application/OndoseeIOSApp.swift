import SwiftUI
import RootFeature

@main
struct OndoseeIOSApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(
                store: .init(
                    initialState: .init(),
                    reducer: {
                        RootCore()
                    }
                )
            )
        }
    }
}
