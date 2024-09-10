import ComposableArchitecture
import SwiftUI

public struct WeeklyForecastView: View {
    let store: StoreOf<WeeklyForecastCore>

    public init(store: StoreOf<WeeklyForecastCore>) {
        self.store = store
    }

    public var body: some View {
        Text("Weekly")
    }
}
