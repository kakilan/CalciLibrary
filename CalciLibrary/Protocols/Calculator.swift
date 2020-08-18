//
//  Calculator.swift
//  Calci
//
//  Created by administrator on 8/8/20.
//  Copyright © 2020 leoVegas. All rights reserved.
//

public protocol Calculator {
    
    func add(operand1: String, and operand2: String) -> String
    func subtract(operand1: String, and operand2: String) -> String
    func multiply(operand1: String, with operand2: String) -> String
    func divide(operand1: String, by operand2:String) -> String
    func sineOf(degrees: String) -> String
    func cosineOf(degrees: String) -> String
    func bitValueOf(coin: String, completion: @escaping(_ result: String) -> Void)
    func addressOf(latitude: String, longitude: String, completion: @escaping(_ result: String) -> Void)
    
    func getAvailableOperations(completion: @escaping(_ supportedOperations: Array<String>) -> Void)
}
