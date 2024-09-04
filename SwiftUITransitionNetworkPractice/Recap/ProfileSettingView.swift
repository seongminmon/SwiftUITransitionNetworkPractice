//
//  ProfileSettingView.swift
//  SwiftUITransitionNetworkPractice
//
//  Created by 김성민 on 9/2/24.
//

import SwiftUI

struct ProfileSettingView: View {
    
    @State private var selectedImageIndex = Int.random(in: 0..<12)
    @State private var selectedMBTIList = [Bool](repeating: false, count: 8)
    @State private var nickname = ""
    
    private let mbtiList = ["E", "S", "T", "J", "I", "N", "F", "P"]
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing: 40) {
            NavigationLink {
                ImageSettingView(selectedImageIndex: $selectedImageIndex)
            } label: {
                SelectedProfileImageView(index: selectedImageIndex)
            }
            
            VStack {
                TextField("닉네임을 입력해주세요 :)", text: $nickname)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
            }
            
            HStack(alignment: .top) {
                Text("MBTI")
                    .bold()
                Spacer()
                LazyVGrid(columns: columns) {
                    ForEach(0..<8) { index in
                        MBTIButton(
                            isSelected: $selectedMBTIList[index],
                            mbti: mbtiList[index]
                        ) {
                            print("\(mbtiList[index]) 탭")
                            if selectedMBTIList[index] {
                                selectedMBTIList[index] = false
                            } else {
                                selectedMBTIList[index] = true
                                selectedMBTIList[(index + 4) % 8] = false
                            }
                        }
                    }
                }
            }
            Spacer()
            NavigationLink {
                CompleteView()
            } label: {
                BlueRadiusText(title: "완료")
            }
        }
        .navigationBarTitle("PROFILE SETTING", displayMode: .inline)
        .padding()
    }
}

#Preview {
    ProfileSettingView()
}
