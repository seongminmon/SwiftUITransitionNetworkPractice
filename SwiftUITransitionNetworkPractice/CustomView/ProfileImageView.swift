//
//  SelectedProfileImageView.swift
//  SwiftUITransitionNetworkPractice
//
//  Created by 김성민 on 9/2/24.
//

import SwiftUI

struct SelectedProfileImageView: View {
    
    let index: Int
    
    var body: some View {
        Image(ImageAsset.profileList[index])
            .resizable()
            .frame(width: 100, height: 100)
            .cornerRadius(50)
            .overlay(
                RoundedRectangle(cornerRadius: 100)
                    .stroke(.blue, lineWidth: 5)
            )
            .overlay(alignment: .bottomTrailing) {
                Image(systemName: "camera.fill")
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.white)
                    .padding(2)
                    .background(.blue, in: Circle())
            }
    }
}

#Preview {
    SelectedProfileImageView(index: 0)
}
