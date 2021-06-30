//
//  MultiLanguage.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 30/06/21.
//

import UIKit

enum MultiLanguageEnum: String {
    case idLang = "id"
    case enLang = "en"
}

struct MultiLanguageDefaultsKey {

    // language
    static let language = "multi-language"
    static let selectedLanguage = "selected-language"
}

struct MultiLanguage {

    static func setLanguage(language: MultiLanguageEnum) {
        UserDefaults.standard.set(language.rawValue, forKey: MultiLanguageDefaultsKey.language)
    }

    static func getLanguage() -> MultiLanguageEnum {
        guard let language = UserDefaults.standard.string(forKey: MultiLanguageDefaultsKey.language) else {
            return .enLang
        }

        return MultiLanguageEnum(rawValue: language) ?? .enLang
    }

}
