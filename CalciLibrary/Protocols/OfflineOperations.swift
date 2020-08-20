//
//  OfflineOperations.swift
//  CalciLibrary
//
//  Created by Akilan on 20/08/20.
//  Copyright © 2020 Akilan. All rights reserved.
//

import Foundation

public protocol OfflineOperations {
    func add(operand1: String, and operand2: String) -> String
    func subtract(operand1: String, and operand2: String) -> String
    func multiply(operand1: String, with operand2: String) -> String
    func divide(operand1: String, by operand2:String) -> String
    func sineOf(degrees: String) -> String
    func cosineOf(degrees: String) -> String
}
