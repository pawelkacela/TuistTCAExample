import SwiftUI
import ComposableArchitecture

@main
struct TuistTCAExampleApp: App {
    var body: some Scene {
        WindowGroup {
            
            HomeView(store:
                        Store(
                            initialState: HomeViewReducer.State(),
                            reducer: {
                                HomeViewReducer()
                            }
                        )
            )
            
        }
    }
}
