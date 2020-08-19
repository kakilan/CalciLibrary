//
//  FirebaseManager.swift
//  Calci
//
//  Created by administrator on 8/8/20.
//  Copyright © 2020 leoVegas. All rights reserved.
//

import FirebaseCore
import FirebaseRemoteConfig

class FirebaseManager {
    
    private var remoteConfig: RemoteConfig = RemoteConfig.remoteConfig()
    private var offlineOperations: Array<String> = ["canAdd", "canSubtract", "canMultiply", "canDivide", "canDoSine", "canDoCosine"]
    
    init() {
        
        // configure FirebaseApp
        let bundle = Bundle(for: type(of: self))
        if
            let filePath = bundle.path(forResource: "GoogleService-Info", ofType: "plist"),
            let options = FirebaseOptions(contentsOfFile: filePath) {
            FirebaseApp.configure(options: options)
        }
        
        // configure RemoteConfig
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 300
        remoteConfig.configSettings = settings
        let defaults: [String: Any?] = [
            "canAdd"            : true,
            "canSubtract"       : true,
            "canMultiply"       : true,
            "canDivide"         : true,
            "canDoSine"         : true,
            "canDoCosine"       : true,
            "can_find_bit"      : false,
            "can_find_map"      : false
        ]
        remoteConfig.setDefaults(defaults as? [String : NSObject])
    }
}

extension FirebaseManager: RemoteConfigService {
    func fetchRemoteConfig(completion: @escaping(_ supportedOperations: Array<String>, _ error: Error?) -> Void) {
        remoteConfig.fetchAndActivate { [unowned self] (status, error) in
            var availableOperations: Array<String> = Array<String>()
            guard error == nil else {
                // Network offline code = 8003
                availableOperations = self.offlineOperations
                completion(availableOperations, error)
                return
            }
            
            print("Got the value from RemoteConfig!")
            
            if self.remoteConfig.configValue(forKey: "can_add").boolValue {
                availableOperations.append("canAdd")
            }
            if self.remoteConfig.configValue(forKey: "can_subtract").boolValue {
                availableOperations.append("canSubtract")
            }
            if self.remoteConfig.configValue(forKey: "can_multiply").boolValue {
                availableOperations.append("canMultiply")
            }
            if self.remoteConfig.configValue(forKey: "can_divide").boolValue {
                availableOperations.append("canDivide")
            }
            if self.remoteConfig.configValue(forKey: "can_do_sine").boolValue {
                availableOperations.append("canDoSine")
            }
            if self.remoteConfig.configValue(forKey: "can_do_cosine").boolValue {
                availableOperations.append("canDoCosine")
            }
            if self.remoteConfig.configValue(forKey: "can_find_bit").boolValue {
                availableOperations.append("canFindBit")
            }
            if self.remoteConfig.configValue(forKey: "can_find_map").boolValue {
                availableOperations.append("canFindMap")
            }
            
            completion(availableOperations, error)
        }
    }
}
