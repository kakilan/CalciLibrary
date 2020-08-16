//
//  HttpClient.swift
//  Calci
//
//  Created by administrator on 8/10/20.
//  Copyright © 2020 leoVegas. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

typealias JSON = [String: Any]

enum HTTPResult<T, E> {
    case success(T)
    case error(E)
}

class HttpClient {
    
    private var session: URLSessionProtocol
    
    init(_ session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    public func request<T: Decodable>(endpoint: String,
                               httpMethod: HttpMethod,
                               _ parameters: [String: String] = [String: String](),
                               completion: @escaping (HTTPResult<T, Error>) -> Void) {
        print(endpoint)
        var components = URLComponents(string: endpoint)!
        var request = URLRequest(url: components.url!)
        parameters.forEach { components.queryItems?.append(URLQueryItem(name: $0, value: $1)) }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = httpMethod.rawValue
        self.session.dataTask(with: request, completionHandler: { (data, response , error) in
            if data != nil && error == nil {
                do {
                    //print(String(data: data!, encoding: .utf8) ?? "")
                    let objectDecoded = try JSONDecoder().decode(T.self, from: data!)
                    completion(.success(objectDecoded))
                } catch {
                    //print(error)
                    completion(.error(error))
                }
                return
            }
            completion(.error(error!))
        }).resume()
    }
}
