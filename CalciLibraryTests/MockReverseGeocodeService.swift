//
//  MockReverseGeocodeService.swift
//  CalciTests
//
//  Created by administrator on 8/11/20.
//  Copyright © 2020 leoVegas. All rights reserved.
//

import Foundation
@testable import CalciLibrary

class MockReverseGeocodeService: ReverseGeocodeService {
    
    private enum MockServiceError: Error {
        case noResponse
    }
    
    private var shouldReturnError: Bool = false
    
    func shouldReturnError(value: Bool) {
        shouldReturnError = value
    }
    
    func reverseGeocode(latitude: Double, longitude: Double, completion: @escaping (String?, Error?) -> Void) {
        if shouldReturnError {
            completion(nil, MockServiceError.noResponse)
        } else {
            completion("Wall St, New York, NY 10005, USA", nil)
        }
    }
}
