//
//  CalciLibrary+CalciAnalytics.swift
//  CalciLibrary
//
//  Created by Akilan on 24/08/20.
//  Copyright © 2020 Akilan. All rights reserved.
//

import Foundation
import FirebaseAnalytics

extension CalciLibrary {
    public struct CalciAnalytics: Analysable {
        public static func logEvent(event: Event, parameters: [String : Any]? = nil) {
            Analytics.logEvent(event.name, parameters: parameters)
        }
    }
}
