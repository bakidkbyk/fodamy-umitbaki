// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  /// Giriş Yap
  public static let bottomButtonText = L10n.tr("Localizable", "bottomButtonText")
  /// Hesabın mı var?
  public static let bottomLabelText = L10n.tr("Localizable", "bottomLabelText")
  /// lütfen bilgilerinizi kontrol ediniz.
  public static let checkInformations = L10n.tr("Localizable", "checkInformations")
  /// E-mail Adresi
  public static let email = L10n.tr("Localizable", "email")
  /// lütfen boş alanları doldurunuz
  public static let emptyFields = L10n.tr("Localizable", "emptyFields")
  /// Şifre
  public static let password = L10n.tr("Localizable", "password")
  /// Üye Ol
  public static let signUpButtonText = L10n.tr("Localizable", "signUpButtonText")
  /// Üye Ol
  public static let title = L10n.tr("Localizable", "title")
  /// Kullanıcı Adı
  public static let username = L10n.tr("Localizable", "username")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    var format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    if let value = Localize.shared.strings[key] {
        format = value
    }
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
