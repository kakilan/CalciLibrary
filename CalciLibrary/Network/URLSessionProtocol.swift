//
//  URLSessionProtocol.swift
//  Calci
//
//  Created by administrator on 8/10/20.
//  Copyright © 2020 leoVegas. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol { }
