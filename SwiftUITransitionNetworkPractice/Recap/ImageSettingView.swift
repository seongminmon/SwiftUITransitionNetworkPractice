//
//  ImageSettingView.swift
//  SwiftUITransitionNetworkPractice
//
//  Created by 김성민 on 9/2/24.
//

import SwiftUI

struct ImageSettingView: View {
    
    @Binding var selectedImageIndex: Int
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing: 50) {
            SelectedProfileImageView(index: selectedImageIndex)
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(0..<12) { index in
                    ProfileImageButton(
                        selectedImageIndex: $selectedImageIndex,
                        index: index
                    )
                }
            }
            Spacer()
        }
        .navigationBarTitle("PROFILE SETTING", displayMode: .inline)
        .padding()
    }
}

#Preview {
    ImageSettingView(selectedImageIndex: .constant(0))
}
