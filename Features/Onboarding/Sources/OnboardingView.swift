//
//  OnboardingView.swift
//  Onboarding
//
//  Created by Pawel Kacela on 27/03/2026.
//

import ComposableArchitecture
import Foundation
import SwiftUI

public struct OnboardingView: View {

    let store: StoreOf<OnboardingReducer>
    
    public init(store: StoreOf<OnboardingReducer>) {
        self.store = store
    }

    public var body: some View {

        VStack {
            ForEach(store.onboardingPages) { page in
                Text("title \(page.title)")
            }
        }

        Text("Hello, World!")
    }

}

#Preview {
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
