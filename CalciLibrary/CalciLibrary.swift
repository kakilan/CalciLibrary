//
//  CalciLibrary.swift
//  Calci
//
//  Created by administrator on 8/8/20.
//  Copyright © 2020 leoVegas. All rights reserved.
//

import Foundation
import FirebaseAnalytics

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
        CalciAnalytics.logEvent(event: EventType.ADDITION)
        guard let opr1 = Double(operand1), let opr2 = Double(operand2) else {
            return CalciString.invalidOperation.localised
        }
        let result = opr1 + opr2
        
        return String(format: "%g", result)
    }
    
    public func subtract(operand1: String, and operand2: String) -> String {
        CalciAnalytics.logEvent(event: EventType.SUBTRACTION)
        guard let opr1 = Double(operand1), let opr2 = Double(operand2) else {
            return CalciString.invalidOperation.localised
        }
        let result = opr1 - opr2
        
        return String(format: "%g", result)
    }
    
    public func multiply(operand1: String, with operand2: String) -> String {
        CalciAnalytics.logEvent(event: EventType.MULTIPLICATION)
        guard let opr1 = Double(operand1), let opr2 = Double(operand2) else {
            return CalciString.invalidOperation.localised
        }
        let result = opr1 * opr2
        
        return String(format: "%g", result)
    }
    
    public func divide(operand1: String, by operand2: String) -> String {
        CalciAnalytics.logEvent(event: EventType.DIVISION)
        guard let opr1 = Double(operand1), let opr2 = Double(operand2), opr2 != 0 else {
            return CalciString.invalidOperation.localised
        }
        let result = opr1 / opr2
        
        return String(format: "%g", result)
    }
    
    public func sineOf(degrees: String) -> String {
        CalciAnalytics.logEvent(event: EventType.SINE)
        guard let degrees = Double(degrees) else {
            return CalciString.invalidOperation.localised
        }
        return String(format: "%g", __sinpi(degrees/180.0))
    }
    
    public func cosineOf(degrees: String) -> String {
        CalciAnalytics.logEvent(event: EventType.COSINE)
        guard let degrees = Double(degrees) else {
            return CalciString.invalidOperation.localised
        }
        return String(format: "%g", __cospi(degrees/180.0))
    }
    
    public func bitValueOf(coin: String, completion: @escaping(_ value: String) -> Void) {
        CalciAnalytics.logEvent(event: EventType.BITCOIN)
        guard let _ = Double(coin) else {
            completion(CalciString.invalidOperation.localised)
            return
        }
        bitCoinService.getBitCoinValue { [unowned self] (value) in
            if let bitCoinValue = value {
                completion("$" + self.multiply(operand1: coin, with: String(format: "%g", bitCoinValue)))
            } else {
                completion(CalciString.informationUnavailable.localised)
            }
        }
    }
    
    public func addressOf(latitude: String, longitude: String, completion: @escaping(_ result: String) -> Void) {
        CalciAnalytics.logEvent(event: EventType.MAP)
        guard let lat = Double(latitude), let long = Double(longitude) else {
            completion(CalciString.invalidOperation.localised)
            return
        }
        reverseGeocodeService.reverseGeocode(latitude: lat, longitude: long) { (result, error) in
            if let _ = error {
                completion(CalciString.informationUnavailable.localised)
            } else if let address = result {
                completion(address)
            } else {
                completion(CalciString.noValidAddress.localised)
            }
        }
    }
    
    public func getAvailableOperations(completion: @escaping(_ supportedOperations: Array<String>) -> Void) {
        remoteConfig.fetchRemoteConfig { (operations, error) in
            completion(operations)
        }
    }
}

extension CalciLibrary {
    public struct CalciAnalytics: Analysable {
        public static func logEvent(event: Event, parameters: [String : Any]? = nil) {
            Analytics.logEvent(event.name, parameters: parameters)
        }
    }
}
