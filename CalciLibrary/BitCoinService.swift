//
//  BitCoinService.swift
//  Calci
//
//  Created by administrator on 8/8/20.
//  Copyright © 2020 leoVegas. All rights reserved.
//

protocol BitCoinService {
    func getBitCoinValue(completion: @escaping (Double?) -> Void)
}
