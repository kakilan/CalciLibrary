//
//  CalciLibrary.swift
//  Calci
//
//  Created by administrator on 8/8/20.
//  Copyright © 2020 leoVegas. All rights reserved.
//

import Foundation

open class CalciLibrary {
    
    private var remoteConfig: RemoteConfigService
    private var bitCoinService: BitCoinService
    private var reverseGeocodeService: ReverseGeocodeService
    
    public init() {
        self.remoteConfig = FirebaseManager()
        self.bitCoinService = BitCoinManager()
        self.reverseGeocodeService = ReverseGeocodeManager()
    }
    
    init(remoteConfig: RemoteConfigService = FirebaseManager(),
         bitCoinService: BitCoinService = BitCoinManager(),
         reverseGeocodeService: ReverseGeocodeService = ReverseGeocodeManager()) {
        self.remoteConfig = remoteConfig
        self.bitCoinService = bitCoinService
        self.reverseGeocodeService = reverseGeocodeService
    }
}

extension CalciLibrary: Calculator {
    
    public func add(operand1: String, and operand2: String) -> String {
        guard let opr1 = Double(operand1), let opr2 = Double(operand2) else {
            return "Invalid Operation"
        }
        let result = opr1 + opr2
        
        return String(format: "%g", result)
    }
    
    public func subtract(operand1: String, and operand2: String) -> String {
        guard let opr1 = Double(operand1), let opr2 = Double(operand2) else {
            return "Invalid Operation"
        }
        let result = opr1 - opr2
        
        return String(format: "%g", result)
    }
    
    public func multiply(operand1: String, with operand2: String) -> String {
        guard let opr1 = Double(operand1), let opr2 = Double(operand2) else {
            return "Invalid Operation"
        }
        let result = opr1 * opr2
        
        return String(format: "%g", result)
    }
    
    public func divide(operand1: String, by operand2: String) -> String {
        guard let opr1 = Double(operand1), let opr2 = Double(operand2), opr2 != 0 else {
            return "Invalid Operation"
        }
        let result = opr1 / opr2
        
        return String(format: "%g", result)
    }
    
    public func sineOf(degrees: String) -> String {
        guard let degrees = Double(degrees) else {
            return "Invalid Operation"
        }
        return String(format: "%g", __sinpi(degrees/180.0))
    }
    
    public func cosineOf(degrees: String) -> String {
        guard let degrees = Double(degrees) else {
            return "Invalid Operation"
        }
        return String(format: "%g", __cospi(degrees/180.0))
    }
    
    public func bitValueOf(coin: String, completion: @escaping(_ value: String) -> Void) {
        guard let _ = Double(coin) else {
            completion("Invalid Operation")
            return
        }
        bitCoinService.getBitCoinValue { [unowned self] (value) in
            if let bitCoinValue = value {
                completion(self.multiply(operand1: coin, with: String(format: "%g", bitCoinValue)))
            } else {
                completion("Information unavailable")
            }
        }
    }
    
    public func addressOf(latitude: String, longitude: String, completion: @escaping(_ result: String) -> Void) {
        guard let lat = Double(latitude), let long = Double(longitude) else {
            completion("Invalid Operation")
            return
        }
        reverseGeocodeService.reverseGeocode(latitude: lat, longitude: long) { (result, error) in
            if let _ = error {
                completion("Information unavailable")
            } else if let address = result {
                completion(address)
            } else {
                completion("No valid address")
            }
        }
    }
    
    public func getAvailableOperations(completion: @escaping(_ supportedOperations: Array<String>) -> Void) {
        remoteConfig.fetchRemoteConfig { (operations, error) in
            completion(operations)
        }
    }
}
