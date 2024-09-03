//
//  UpbitAPI.swift
//  SwiftUITransitionNetworkPractice
//
//  Created by 김성민 on 9/3/24.
//

import Foundation

typealias Markets = [Market]

struct UpbitAPI {
    private init() {}

    static func fetchAllMarket() async throws -> Markets {
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        let (data, response) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode(Markets.self, from: data)
        return decodedData
    }
}
