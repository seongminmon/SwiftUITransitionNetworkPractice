//
//  ProfileImageButton.swift
//  SwiftUITransitionNetworkPractice
//
//  Created by 김성민 on 9/2/24.
//

import SwiftUI

struct ProfileImageButton: View {
    
    @Binding var selectedImageIndex: Int
    let index: Int
    
    var body: some View {
        Button {
            selectedImageIndex = index
        } label: {
            Image(ImageAsset.profileList[index])
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(40)
                .overlay {
                    if selectedImageIndex == index {
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(.blue, lineWidth: 5)
                    } else {
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(.gray, lineWidth: 1)
                    }
                }
        }
    }
}

#Preview {
    ProfileImageButton(selectedImageIndex: .constant(0), index: 0)
}
