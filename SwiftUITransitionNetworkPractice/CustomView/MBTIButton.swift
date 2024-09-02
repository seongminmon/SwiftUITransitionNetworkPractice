//
//  MBTIButton.swift
//  SwiftUITransitionNetworkPractice
//
//  Created by 김성민 on 9/2/24.
//

import SwiftUI

struct MBTIButton: View {
    
    @Binding var isSelected: Bool
    let mbti: String
    let action: () -> Void
    
    var body: some View {
        Button(mbti) {
            action()
        }
        .frame(width: 40, height: 40)
        .foregroundStyle(isSelected ? .white : .gray)
        .background(isSelected ? .blue : .clear, in: Circle())
        .cornerRadius(50)
        .overlay {
            if !isSelected {
                RoundedRectangle(cornerRadius: 100)
                    .stroke(.gray, lineWidth: 1)
            }
        }
    }
}

#Preview {
    MBTIButton(isSelected: .constant(true), mbti: "E") {
        print("E 탭")
    }
}
