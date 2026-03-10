//
//  HomeView.swift
//  TuistTCAExample
//
//  Created by Pawel Kacela on 10/03/2026.
//

import SwiftUI
import ComposableArchitecture


struct HomeViewReducer: Reducer {
    
    struct State: Equatable {
        var someName: String
        
        init(someName: String = "") {
            self.someName = someName
        }
    }
    
    enum Action: Equatable {
        case someAction
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .someAction:
                print("some action")
                return .none
            }
        }
    }
}

struct HomeView: View {
    
    let store: StoreOf<HomeViewReducer>
    
    var body: some View {
        Text("Home View")
        Button {
            store.send(.someAction)
        } label: {
            Text("Test button")
        }

    }
}

#Preview {
    HomeView(store:
                Store(
                    initialState: HomeViewReducer.State(),
                    reducer: {
                        HomeViewReducer()
                    }
                )
    )
}
