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
        var selectedPage: Int
        
        public init(
            onboardingPages: [PageDTO] = [],
            selectedPage: Int = 0
        ) {
            
            self.onboardingPages = mockOnboardingPages //onboardingPages
            self.selectedPage = selectedPage
        }
        
    }
    
    public enum Action: Equatable {
        case nextButtonTapped
        case didSkip
        case didFinish
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .nextButtonTapped:
                print("next tapped")
                return .none
            case .didSkip:
                print("didSkip tapped")
                return .none
            case .didFinish:
                print("didFinish tapped")
                return .none
            }
        }
    }
    
}


public let mockOnboardingPages: [PageDTO] = [
    PageDTO(
        id: UUID(),
        title: "Welcome to Steam",
        description: "this frist description"
    ),
    PageDTO(
        id: UUID(),
        title: "Discover Games",
        description: "this second description"
    ),
]
