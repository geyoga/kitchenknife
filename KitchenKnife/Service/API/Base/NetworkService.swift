//
//  NetworkService.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 03/07/21.
//

import Foundation
import PromiseKit
import PMKFoundation
import SwiftyJSON

protocol NetworkServiceProtocol {
    static func request<T: Codable>(
        url: String
    ) -> Promise<T>
}

class NetworkService: NetworkServiceProtocol {

    // MARK: - Network Service Protocol

    static func request<T>(
        url: String
    ) -> Promise<T> where T: Decodable, T: Encodable {
        
        return Promise { seal in
            firstly {
                URLSession.shared.dataTask(
                    .promise,
                    with: URL(string: url)!
                ).validate()
            }.done { data in
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let objectDecoded = try decoder.decode(T.self, from: data.data)
                    seal.resolve(.fulfilled(objectDecoded))
                } catch let error {
                    seal.reject(error)
                }
                // seal.fulfill(data)
            }.catch { error in
                seal.reject(error)
            }
        }
    }
}
