//
//  RemoteConfigService.swift
//  Calci
//
//  Created by administrator on 8/8/20.
//  Copyright © 2020 leoVegas. All rights reserved.
//

protocol RemoteConfigService {
    func fetchRemoteConfig(completion: @escaping(_ supportedOperations: Array<String>, _ error: Error?) -> Void)
}
