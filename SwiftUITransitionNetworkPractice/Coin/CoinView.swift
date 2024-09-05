//
//  CoinView.swift
//  SwiftUITransitionNetworkPractice
//
//  Created by 김성민 on 9/5/24.
//

import SwiftUI

struct CoinView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                bannerView()
                LazyVStack {
                    ForEach(0..<10) { item in
                        coinCell()
                    }
                }
            }
            .navigationTitle("Coin")
        }
    }
    
    func bannerView() -> some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(.blue.gradient)
            .frame(maxWidth: .infinity)
            .frame(height: 150)
            .overlay(alignment: .leading) {
                Circle()
                    .fill(.white.opacity(0.3))
                    .scaleEffect(2)
                    .offset(x: -50)
            }
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading) {
                    Text("11111")
                    Text("22222")
                        .font(.title)
                        .bold()
                }
                .foregroundStyle(.white)
                .padding()
            }
            .padding()
    }
    
    func coinCell() -> some View {
        HStack {
            VStack {
                Text("1111")
                    .bold()
                Text("2222")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text("3333")
        }
        .padding()
    }
}

#Preview {
    CoinView()
}
