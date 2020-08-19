//
//  BitCoinManager.swift
//  Calci
//
//  Created by administrator on 8/10/20.
//  Copyright © 2020 leoVegas. All rights reserved.
//

import Foundation

class BitCoinManager {
    
    private let API = "https://api.coindesk.com/v1/bpi/currentprice.json"
    private let httpClient: HttpClient

    init(_ httpClient: HttpClient = HttpClient()) {
        self.httpClient = httpClient
    }
    
    private func get(completion: @escaping (HTTPResult<BitCoin, Error>) -> Void) {
        httpClient.request(endpoint: API,
                           httpMethod: HttpMethod.get,
                       completion: completion)
    }
}

extension BitCoinManager: BitCoinService {
    func getBitCoinValue(completion: @escaping (Double?) -> Void) {
        get { (result) in
            switch result {
            case .success(let bitCoin):
                completion(bitCoin.bpi.usd.doubleValue)
            case .error(_):
                completion(nil)
            }
        }
    }
}
