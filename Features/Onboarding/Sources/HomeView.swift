//
//  HomeView.swift
//  TuistTCAExample
//
//  Created by Pawel Kacela on 10/03/2026.
//

import ComposableArchitecture
import SwiftUI


public struct HomeViewReducer: Reducer {
    
    public init() { }
    
    public struct State: Equatable {
        var someName: String
        
        public init(someName: String = "") {
            self.someName = someName
        }
    }
    
    public enum Action: Equatable {
        case someAction
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .someAction:
                print("some action")
                return .none
            }
        }
    }
}

public struct HomeView: View {
    
    public init(store: StoreOf<HomeViewReducer>) {
        self.store = store
    }
    
   let store: StoreOf<HomeViewReducer>
    
    public var body: some View {
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
