import ComposableArchitecture
import MainFeature
import SettingFeature
import WeeklyForecastFeature
import DesignSystem
import SwiftUI

public struct MainTabView: View {
    let store: StoreOf<MainTabCore>

    public init(store: StoreOf<MainTabCore>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            TabView {
                MainView(store: store.scope(
                    state: \.mainCore,
                    action: MainTabCore.Action.mainCore)
                )
                .tag(TabFlow.main)
                .tabItem {
                    ODIcon(.home)

                    Text("대시보드")
                        .font(.medium(.system, size: .text3))
                }

                WeeklyForecastView(store: store.scope(
                    state: \.weeklyCore,
                    action: MainTabCore.Action.weeklyCore))
                .tag(TabFlow.weekly)
                .tabItem {
                    ODIcon(.calendar)

                    Text("주간 예보")
                        .font(.medium(.system, size: .text3))
                }

                SettingView(store: store.scope(
                    state: \.settingCore,
                    action: MainTabCore.Action.settingCore)
                )
                .tag(TabFlow.setting)
                .tabItem {
                    ODIcon(.setting)

                    Text("설정")
                        .font(.medium(.system, size: .text3))
                }
            }
        }
    }
}
