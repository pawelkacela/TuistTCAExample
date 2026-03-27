//
//  OnboardingReducer.swift
//  Onboarding
//
//  Created by Pawel Kacela on 27/03/2026.
//

import Foundation
import ComposableArchitecture

@Reducer
public struct OnboardingReducer {
    
    public init() { }
    
    @ObservableState
    public struct State: Equatable {
        var onboardingPages: [PageDTO]
        
        public init(onboardingPages: [PageDTO] = []) {
            self.onboardingPages = onboardingPages
        }
    }
    
    public enum Action: Equatable {
        case nextButtonTapped
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                case .nextButtonTapped:
                    print("next tapped")
                return .none
            }
        }
    }
    
}
