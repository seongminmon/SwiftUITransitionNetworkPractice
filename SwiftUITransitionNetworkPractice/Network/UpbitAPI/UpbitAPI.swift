//
//  UpbitAPI.swift
//  SwiftUITransitionNetworkPractice
//
//  Created by 김성민 on 9/3/24.
//

import Foundation

struct UpbitAPI {
    private init() {}

    static func fetchAllMarket() async throws -> [Market] {
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode([Market].self, from: data)
        return decodedData
    }
}
