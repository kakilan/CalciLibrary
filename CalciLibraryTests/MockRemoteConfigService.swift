//
//  MockRemoteConfigService.swift
//  CalciTests
//
//  Created by administrator on 8/11/20.
//  Copyright © 2020 leoVegas. All rights reserved.
//

import Foundation
@testable import CalciLibrary

class MockRemoteConfigService: RemoteConfigService {
    
    private enum MockServiceError: Error {
        case noResponse
    }
    
    private var shouldReturnError: Bool = false
    
    func shouldReturnError(value: Bool) {
        shouldReturnError = value
    }
    
    func fetchRemoteConfig(completion: @escaping(_ supportedOperations: Array<String>, _ error: Error?) -> Void) {
        
        if shouldReturnError {
            completion([], MockServiceError.noResponse)
        } else {
            let supportedOperations: Array<String> = [
                "canAdd",
                "canSubtract",
                "canMultiply",
                "canDivide",
                "canDoSine",
                "canDoCosine",
                "canFindBit",
                "canFindMap"
            ]
            completion(supportedOperations, nil)
        }
    }
}
