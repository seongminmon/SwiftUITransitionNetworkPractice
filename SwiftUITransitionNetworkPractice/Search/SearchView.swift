//
//  SearchView.swift
//  SwiftUITransitionNetworkPractice
//
//  Created by 김성민 on 9/2/24.
//

import SwiftUI

struct SearchView: View {
    
    @State private var text = ""
    @State private var markets: [Market] = []
    
    private var filteredMarkets: [Market] {
        return text.isEmpty ? markets : markets.filter { $0.koreanName.contains(text) }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                listView(filteredMarkets)
            }
            .navigationTitle("Search")
            .searchable(text: $text)
        }
        .task {
            print("task")
            do {
                let result = try await UpbitAPI.fetchAllMarket()
                markets = result
            } catch {
                print("통신 실패")
            }
        }
    }
    
    private func listView(_ markets: [Market]) -> some View {
        LazyVStack {
            ForEach(markets, id: \.self) { item in
                cell(item)
            }
        }
    }
    
    private func cell(_ item: Market) -> some View {
        HStack {
            Image(systemName: "circle")
            VStack(alignment: .leading) {
                Text(item.koreanName)
                Text(item.market)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Button {
                print("즐겨찾기 탭 \(item)")
            } label: {
                Image(systemName: "star")
                    .foregroundStyle(.black)
            }
        }
        .padding()
    }
}

#Preview {
    SearchView()
}
