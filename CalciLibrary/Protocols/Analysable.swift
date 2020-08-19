//
//  Analysable.swift
//  CalciLibrary
//
//  Created by Akilan on 17/08/20.
//  Copyright © 2020 Akilan. All rights reserved.
//

import Foundation

protocol Analysable {
    static func logEvent(event: Event, parameters: [String : Any]?)
}

extension Analysable {
    static func logEvent(event: Event, parameters: [String : Any]? = nil) { }
}
