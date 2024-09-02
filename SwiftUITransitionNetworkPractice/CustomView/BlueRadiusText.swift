//
//  BlueRadiusText.swift
//  SwiftUITransitionNetworkPractice
//
//  Created by 김성민 on 9/2/24.
//

import SwiftUI

struct BlueRadiusText: View {
    
    let title: String
    
    var body: some View {
        Text(title)
        .font(.system(size: 20, weight: .bold))
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .foregroundStyle(.white)
        .background(.blue)
        .clipShape(.capsule)
    }
}

#Preview {
    BlueRadiusText(title: "완료")
}
