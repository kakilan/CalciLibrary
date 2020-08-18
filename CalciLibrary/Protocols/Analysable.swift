//
//  Analysable.swift
//  CalciLibrary
//
//  Created by Akilan on 17/08/20.
//  Copyright © 2020 Akilan. All rights reserved.
//

import Foundation

public protocol Analysable {
    static func logEvent(event: Event, parameters: [String : Any]?)
}

extension Analysable {
    public static func logEvent(event: Event, parameters: [String : Any]? = nil) { }
}
