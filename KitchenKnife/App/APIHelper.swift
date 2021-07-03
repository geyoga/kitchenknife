//
//  APIHelper.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 30/06/21.
//

import UIKit
import PMKFoundation
import SwiftyJSON

extension UIViewController {
    func handleError(error: Error) {
        var errorMessage: String = ""
        var errorCode: Int = -1
        if let errorResponse = error as? ErrorResponseModel {
            errorMessage = errorResponse.meta.message
            errorCode = errorResponse.meta.code
        } else {
            if let httpError = error as? PMKHTTPError {
                switch httpError {
                case .badStatusCode( _, _, let response):
                    errorCode = response.statusCode
                }
                // catch any message as possible from BE side
                if let message = JSON(httpError.jsonDictionary as Any)["message"].string {
                    errorMessage = message
                } else if let message = JSON(httpError.jsonDictionary as Any)["error_description"].string {
                    errorMessage = message
                } else if let message = JSON(httpError.jsonDictionary as Any)["error"].string {
                    errorMessage = message
                } else {
                    errorMessage = error.localizedDescription
                }
            } else {
                errorMessage = error.localizedDescription
            }
        }

       /// show warning error
    }
}
