// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {

  /// Update bundle if you need to change app language
  static var bundle: Bundle?

  /// About Developer
  static var aboutDeveloper: String {
    return L10n.tr("Localizable", "about_developer")
  }
  /// Categories
  static var categoriesTitle: String {
    return L10n.tr("Localizable", "categories_title")
  }
  /// Lets Cook
  static var chooseCategoryAction: String {
    return L10n.tr("Localizable", "choose_category_action")
  }
  /// we will show the recipe according to your choice
  static var chooseCategoryDesc: String {
    return L10n.tr("Localizable", "choose_category_desc")
  }
  /// Choose Category
  static var chooseCategoryTitle: String {
    return L10n.tr("Localizable", "choose_category_title")
  }
  /// Recipes
  static var homeTitle: String {
    return L10n.tr("Localizable", "home_title")
  }
  /// Logout
  static var logout: String {
    return L10n.tr("Localizable", "logout")
  }
  /// A slice of recipe for you
  static var onboardingDescOne: String {
    return L10n.tr("Localizable", "onboarding_desc_one")
  }
  /// Welcome to Kitchen Knife
  static var onboardingTitleOne: String {
    return L10n.tr("Localizable", "onboarding_title_one")
  }
  /// Cook what ever you want
  static var onboardingTitleThree: String {
    return L10n.tr("Localizable", "onboarding_title_three")
  }
  /// Find your secret recipe around the world
  static var onboardingTitleTwo: String {
    return L10n.tr("Localizable", "onboarding_title_two")
  }
  /// try another keyword
  static var recipeNotfoundDesc: String {
    return L10n.tr("Localizable", "recipe_notfound_desc")
  }
  /// Recipes for '%@' not found
  static func recipeNotfoundTitleFor(_ p1: String) -> String {
    return L10n.tr("Localizable", "recipe_notfound_title_for", p1)
  }
  /// Recipes Preferences
  static var recipePreferences: String {
    return L10n.tr("Localizable", "recipe_preferences")
  }
  /// Recommend for you
  static var recommendTitle: String {
    return L10n.tr("Localizable", "recommend_title")
  }
  /// Resource References
  static var resourceReferences: String {
    return L10n.tr("Localizable", "resource_references")
  }
  /// Settings
  static var settingsTitle: String {
    return L10n.tr("Localizable", "settings_title")
  }
  /// Skip for now
  static var skipNow: String {
    return L10n.tr("Localizable", "skip_now")
  }
  /// Today’s pick
  static var todayPickTitle: String {
    return L10n.tr("Localizable", "today_pick_title")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let language = MultiLanguage.getLanguage().rawValue
    let searchBundle = Bundle(path: Bundle.main.path(forResource: language, ofType: "lproj")!)!
    let format = NSLocalizedString(key, tableName: table, bundle: searchBundle, comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
