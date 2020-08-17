//
//  Analytics.swift
//  CalciLibrary
//
//  Created by Akilan on 17/08/20.
//  Copyright © 2020 Akilan. All rights reserved.
//

import Foundation

public protocol Analytics {
    func logEvent(event: Event)
}
