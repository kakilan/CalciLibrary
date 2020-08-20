//
//  RemoteConfigurable.swift
//  CalciLibrary
//
//  Created by Akilan on 20/08/20.
//  Copyright © 2020 Akilan. All rights reserved.
//

import Foundation

public protocol RemoteConfigurable {
    func getAvailableOperations(completion: @escaping(_ supportedOperations: Array<String>) -> Void)
}
