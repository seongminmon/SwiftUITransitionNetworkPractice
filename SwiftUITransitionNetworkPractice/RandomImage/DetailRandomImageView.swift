//
//  DetailRandomImageView.swift
//  SwiftUITransitionNetworkPractice
//
//  Created by 김성민 on 9/4/24.
//

import SwiftUI

struct DetailRandomImageView: View {

    @Binding var title: String
//    let url: URL?
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("섹션 타이틀 변경하기", text: $title)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

//#Preview {
//    DetailRandomImageView(title: .constant("인물"))
//}
