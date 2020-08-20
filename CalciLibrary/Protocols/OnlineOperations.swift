//
//  OnlineOperations.swift
//  CalciLibrary
//
//  Created by Akilan on 20/08/20.
//  Copyright © 2020 Akilan. All rights reserved.
//

import Foundation

public protocol OnlineOperations {
    func bitValueOf(coin: String, completion: @escaping(_ result: String) -> Void)
    func addressOf(latitude: String, longitude: String, completion: @escaping(_ result: String) -> Void)
}
