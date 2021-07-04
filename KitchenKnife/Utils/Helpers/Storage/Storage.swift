//
//  Storage.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 03/07/21.
//

import Foundation

struct Storage {

    enum FirstLogin {
        static let firstLoginKey: String = "first_login_key"
        static func setLogin(_ isLogin: Bool) {
            UserDefaults.standard.setValue(isLogin, forKey: firstLoginKey)
        }
        static func getLogin() -> Bool {
            return UserDefaults.standard.bool(forKey: firstLoginKey)
        }
    }
}
