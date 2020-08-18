//
//  MockBitCoinService.swift
//  CalciTests
//
//  Created by administrator on 8/11/20.
//  Copyright © 2020 leoVegas. All rights reserved.
//

import Foundation
@testable import CalciLibrary

class MockBitCoinService: BitCoinService {
    
    private var shouldReturnError: Bool = false
    
    func shouldReturnError(value: Bool) {
        shouldReturnError = value
    }
    
    func getBitCoinValue(completion: @escaping (Double?) -> Void) {
        if shouldReturnError {
            completion(nil)
        } else {
            completion(11532.70)
        }
    }
}
