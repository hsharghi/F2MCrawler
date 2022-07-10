//
//  File.swift
//  
//
//  Created by Hadi Sharghi on 7/11/22.
//

import Foundation

protocol RequestProvider {
    func request(from: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

class ApiRequest: RequestProvider {
    public func request(from: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let url = URL(string: from) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}

