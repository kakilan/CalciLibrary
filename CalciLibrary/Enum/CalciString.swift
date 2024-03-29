//
//  CalciString.swift
//  CalciLibrary
//
//  Created by Akilan on 18/08/20.
//  Copyright © 2020 Akilan. All rights reserved.
//

import Foundation

public enum CalciString {
    case noValidAddress
    case invalidOperation
    case informationUnavailable
}

extension CalciString: Localisable {
    public var localised: String {
        get {
            switch self {
            case .noValidAddress:               return NSLocalizedString("noValidAddress", comment: "")
            case .invalidOperation:             return NSLocalizedString("invalidOperation", comment: "")
            case .informationUnavailable:       return NSLocalizedString("informationUnavailable", comment: "")
            }
        }
    }
}
