//
//  OnboardingView.swift
//  SwiftUITransitionNetworkPractice
//
//  Created by 김성민 on 9/2/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("HELLO.\n MY POLAROID")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.blue)
                Image("polaroid", bundle: .main)
                Spacer()
                NavigationLink {
                    ProfileSettingView()
                } label: {
                    BlueRadiusText(title: "시작하기")
                }
            }
        }
        
    }
}

#Preview {
    OnboardingView()
}
