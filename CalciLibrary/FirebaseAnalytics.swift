//
//  FirebaseAnalytics.swift
//  CalciLibrary
//
//  Created by Akilan on 17/08/20.
//  Copyright © 2020 Akilan. All rights reserved.
//

import Firebase

public class FirebaseAnalytics: Analytics {
    public func logEvent(event: Event) {
        Firebase.Analytics.logEvent(event.name, parameters: nil)
    }
}
