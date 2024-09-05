//
//  Market.swift
//  SwiftUITransitionNetworkPractice
//
//  Created by 김성민 on 9/3/24.
//

import Foundation

struct Market: Hashable, Codable, Identifiable {
    let id = UUID()
    var like = false
    
    let market, koreanName, englishName: String

    enum CodingKeys: String, CodingKey {
        case market
        case koreanName = "korean_name"
        case englishName = "english_name"
    }
}
