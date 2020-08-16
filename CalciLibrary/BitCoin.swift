//
//  BitCoin.swift
//  Calci
//
//  Created by administrator on 8/10/20.
//  Copyright © 2020 leoVegas. All rights reserved.
//

import Foundation

struct BitCoin: Codable {
    let bpi: BPI

    enum CodingKeys: String, CodingKey {
        case bpi
    }
}

struct BPI: Codable {
    let usd: USD

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

struct USD: Codable {
    let code: String
    let symbol: String
    let rate: String
    let description: String
    let doubleValue: Double
    
    enum CodingKeys: String, CodingKey {
        case code
        case symbol
        case rate
        case description
        case doubleValue = "rate_float"
    }
}
