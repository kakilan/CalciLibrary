//
//  ReverseGeocodeManager.swift
//  Calci
//
//  Created by administrator on 8/10/20.
//  Copyright © 2020 leoVegas. All rights reserved.
//

import Foundation
import CoreLocation

extension CLPlacemark {

    var compactAddress: String? {
        if let name = name {
            var result = name

            if let street = thoroughfare {
                result += ", \(street)"
            }

            if let city = locality {
                result += ", \(city)"
            }

            if let country = country {
                result += ", \(country)"
            }

            return result
        }

        return nil
    }
}

class ReverseGeocodeManager: ReverseGeocodeService {
    
    private lazy var geocoder = CLGeocoder()
    
    public func reverseGeocode(latitude: Double, longitude: Double, completion: @escaping (String?, Error?) -> Void) {
        // Create Location
        let location = CLLocation(latitude: latitude, longitude: longitude)

        // Geocode Location
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            // Process Response
            if let error = error {
                completion(nil, error)
            } else {
                if let placemarks = placemarks, let placemark = placemarks.first {
                    completion(placemark.compactAddress, nil)
                } else {
                    completion(CalciString.noValidAddress.localised, nil)
                }
            }
        }
    }
}
