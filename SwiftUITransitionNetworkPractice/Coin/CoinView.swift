//
//  CoinView.swift
//  SwiftUITransitionNetworkPractice
//
//  Created by 김성민 on 9/5/24.
//

import SwiftUI

struct CoinView: View {
    
    // MARK: - 1. task >> 네트워크 통신
    // MARK: - 2. like 토글 >> 디테일뷰와 동기화
    // MARK: - 3. 검색 >> 필터링된 데이터 보이기
    // MARK: - 4. 검색으로 필터링된 데이터에서도 like 동기화
    
    @State private var marketList: [Market] = []
    @State private var filteredMarkets: [Market] = []
    @State private var text = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                bannerView(filteredMarkets.randomElement() ?? Market(market: "", koreanName: "", englishName: ""))
                
                LazyVStack {
                    ForEach($filteredMarkets, id: \.id) { item in
                        NavigationLink {
                            NavigationLazyView(CoinCell(
                                item: item,
                                originItem: $marketList.filter { $0.id == item.id }.first!
                            ))
                        } label: {
                            CoinCell(
                                item: item,
                                originItem: $marketList.filter { $0.id == item.id }.first!
                            )
                        }
                        .foregroundStyle(.black)
                    }
                }
            }
            .navigationTitle("Coin")
            .searchable(
                text: $text,
                placement: .navigationBarDrawer,
                prompt: "코인을 검색해보세요"
            )
            .onSubmit(of: .search) {
                filteredMarkets = text.isEmpty ? marketList : marketList.filter { $0.koreanName.contains(text) }
            }
            .onChange(of: text) { oldValue, newValue in
                if newValue.isEmpty {
                    filteredMarkets = marketList
                }
            }
        }
        .task {
            do {
                let result = try await UpbitAPI.fetchAllMarket()
                marketList = result
                filteredMarkets = result
            } catch {
                print("api 통신 실패")
            }
        }
    }
    
    private func bannerView(_ item: Market) -> some View {
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
                    Text(item.market)
                    Text("\((Int.random(in: 1000...5000) * 150).formatted())원")
                        .font(.title)
                        .bold()
                }
                .foregroundStyle(.white)
                .padding()
            }
            .padding()
    }
}

struct CoinCell: View {
    
    @Binding var item: Market
    @Binding var originItem: Market
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.koreanName)
                    .bold()
                Text(item.market)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text(item.englishName)
            Button {
                item.like.toggle()
                originItem.like.toggle()
            } label: {
                Image(systemName: item.like ? "star.fill" : "star")
            }
            .foregroundStyle(.black)
        }
        .padding(.horizontal)
        .padding(.vertical, 6)
    }
}

#Preview {
    CoinView()
}
