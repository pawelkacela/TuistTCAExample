import SwiftUI
import ComposableArchitecture
import Onboarding

@main
struct SteamWrappedApp: App {
    var body: some Scene {
        WindowGroup {
            
            HomeView(store:
                        StoreOf<HomeViewReducer>(
                            initialState: HomeViewReducer.State(),
                            reducer: {
                                HomeViewReducer()
                            }
                        )
            )
        }
    }
}

