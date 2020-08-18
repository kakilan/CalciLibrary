//
//  EventType.swift
//  CalciLibrary
//
//  Created by Akilan on 17/08/20.
//  Copyright © 2020 Akilan. All rights reserved.
//

import Foundation

enum EventType {
    
    case ADDITION
    case SUBTRACTION
    case MULTIPLICATION
    case DIVISION
    case SINE
    case COSINE
    case BITCOIN
    case MAP
}

extension EventType: Event {
    var name: String {
        get {
            switch self {
            case .ADDITION:         return "addition"
            case .SUBTRACTION:      return "subtraction"
            case .MULTIPLICATION:   return "multipliation"
            case .DIVISION:         return "division"
            case .SINE:             return "sine"
            case .COSINE:           return "cosine"
            case .BITCOIN:          return "bitcoin"
            case .MAP:              return "map"
            }
        }
    }
}
