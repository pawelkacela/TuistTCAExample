import SwiftUI
import ComposableArchitecture
import Onboarding

@main
struct SteamWrappedApp: App {
    var body: some Scene {
        WindowGroup {
            
            OnboardingView(
                store:
                    Store(
                        initialState: OnboardingReducer.State(),
                        reducer: {
                            OnboardingReducer()
                        }
                    )
            )
            
        }
    }
}

