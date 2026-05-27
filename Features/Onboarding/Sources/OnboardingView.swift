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

    @State var selectedPage = 0
    @State var offset: CGFloat = 0
    
    public var body: some View {

        VStack {
            GeometryReader { geometry in
                ScrollView(.init()) {
                    TabView(selection: $selectedPage) {
                        ForEach(Array(store.onboardingPages.enumerated()), id: \.offset) { index, page in

                                OnboardingPageView(page: page, geometry: geometry)
                                    .tag(index)
                                    .overlay(
                                        GeometryReader { proxy -> Color in
                                            let minX = proxy.frame(in: .global).minX

                                            DispatchQueue.main.async {
                                                withAnimation(.default) {
                                                    let missingOffset = CGFloat(index) * geometry.size.width
                                                    self.offset = -minX + missingOffset
                                                }
                                            }

                                            return Color.clear
                                        }.frame(width: 0, height: 0)
                                        , alignment: .leading)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .animation(.easeInOut, value: selectedPage)
                    .transition(.slide)
                }
            }

            Spacer()

//            OnboardingBottomPanel(delegate: self.delegate, pagesRange: onboardingPages.indices,
//                                  tabSelection: $selectedPage, offset: $offset)
        }

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




struct OnboardingPageView: View {

    let page: PageDTO
    let geometry: GeometryProxy

    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "square.fill")
                .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                .foregroundColor(.red)
                .background(Color.gray.opacity(0.3))
                
            if let pageTitle = page.title {
                Text(pageTitle)
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.top, 32)
                    .padding(.bottom, 0)
            }
            if let pageDescription = page.description {
                Text(.init(pageDescription))
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16))
                    .frame(maxWidth: 335)
                    .padding()
            }
            Spacer()

        }
        
    }

}

