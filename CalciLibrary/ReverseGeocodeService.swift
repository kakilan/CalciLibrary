//
//  ReverseGeocodeService.swift
//  Calci
//
//  Created by administrator on 8/8/20.
//  Copyright © 2020 leoVegas. All rights reserved.
//

protocol ReverseGeocodeService {
    func reverseGeocode(latitude: Double, longitude: Double, completion: @escaping (String?, Error?) -> Void)
}
