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
        UITabBar.appearance().backgroundColor = .clear
        UITabBar.appearance().scrollEdgeAppearance = .init()
    }

    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            TabView(selection: viewStore.binding(
                get: \.tabFlow,
                send: MainTabCore.Action.changeTabFlow
            )) {
                MainView(store: store.scope(
                        state: \.mainCore,
                        action: MainTabCore.Action.mainCore
                ))
                .tag(TabFlow.main)
                .tabItem {
                    tabBarItem(.home, text: "대시보드")
                }

                WeeklyForecastView(store: store.scope(
                    state: \.weeklyCore,
                    action: MainTabCore.Action.weeklyCore
                ))
                .tag(TabFlow.weekly)
                .tabItem {
                    tabBarItem(.calendar, text: "주간 예보")
                }

                SettingView(store: store.scope(
                    state: \.settingCore,
                    action: MainTabCore.Action.settingCore
                ))
                .tag(TabFlow.setting)
                .tabItem {
                    tabBarItem(.setting, text: "설정")
                }
            }
            .accentColor(.ondosee(.system(.selected)))
        }
    }

    @ViewBuilder
    func tabBarItem(
        _ icon: ODIcon.Icon,
        text: String
    ) -> some View {
        VStack(spacing: 4) {
            ODIcon(icon)

            Text(text)
                .font(.medium(.system, size: .text3))
        }
    }
}
