//
//  APIService.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 03/07/21.
//

import Foundation
import PromiseKit
import PMKFoundation
import SwiftyJSON

class APIService {

    // MARK: - Properties

    static var baseURL: String = ""

    // MARK: - Helpers

    static func request<T>(
        url: String? = nil,
        path: String
    ) -> Promise<T> where T: Decodable, T: Encodable {
        let completeUrl = createUrl(url: url, path: path)

        return Promise { seal in
            firstly {
                NetworkService.request(
                    url: completeUrl
                )
            }.done { data in
                seal.resolve(.fulfilled(data))
            }.catch { error in
                if let httpError = error as? PMKHTTPError {
                    // try to decode json
                    if let jsonDictionary = httpError.jsonDictionary {
                        let json = JSON(jsonDictionary)
                        switch httpError {
                        case .badStatusCode( _, _, _):
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            do {
                                let errorResponseModel = try decoder.decode(
                                    ErrorResponseModel.self, from: json.rawData()
                                )
                                seal.reject(errorResponseModel)
                            } catch _ {
                                seal.reject(httpError)
                            }
                        }
                    } else {
                        seal.reject(httpError)
                    }
                } else {
                    // check if a decoding error
                    if (error as? DecodingError) != nil {
                        let decodeError = NSError(
                            domain: "Kitchen Knife",
                            code: -1,
                            userInfo: [NSLocalizedDescriptionKey: "Failed to decoded response"]
                        )
                        seal.reject(decodeError)
                    } else {
                        seal.reject(error)
                    }
                }
            }
        }
    }

    static func createUrl(url: String? = nil, path: String) -> String {
        return (url == nil) ? "\(baseURL)\(path)" : "\(url ?? "")\(path)"
    }

}
