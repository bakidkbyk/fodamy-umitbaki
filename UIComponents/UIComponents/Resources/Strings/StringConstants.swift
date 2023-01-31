// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum ForgotPassword {
    /// E-mail Adresi
    public static let emailPlaceHolder = L10n.tr("Localizable", "ForgotPassword.emailPlaceHolder")
    /// Lütfen geçerli bir email adresi giriniz.
    public static let emptyEmailAdress = L10n.tr("Localizable", "ForgotPassword.emptyEmailAdress")
    /// Şifre Yenileme isteğiniz başarılı!
    public static let isSuccess = L10n.tr("Localizable", "ForgotPassword.isSuccess")
    /// Sıfırla
    public static let refreshPasswordButtonText = L10n.tr("Localizable", "ForgotPassword.refreshPasswordButtonText")
    /// Şifre Sıfırlama
    public static let title = L10n.tr("Localizable", "ForgotPassword.title")
  }

  public enum Login {
    /// Üye Ol
    public static let bottomButtonText = L10n.tr("Localizable", "Login.bottomButtonText")
    /// Hesabın mı yok?
    public static let bottomLabelText = L10n.tr("Localizable", "Login.bottomLabelText")
    /// lütfen bilgilerinizi kontrol ediniz.
    public static let checkInformations = L10n.tr("Localizable", "Login.checkInformations")
    /// lütfen boş alanları doldurunuz
    public static let emptyFields = L10n.tr("Localizable", "Login.emptyFields")
    /// Şifrenizi mi unuttunuz?
    public static let forgotPasswordButtonText = L10n.tr("Localizable", "Login.forgotPasswordButtonText")
    /// Giriş Yap
    public static let loginButtonText = L10n.tr("Localizable", "Login.loginButtonText")
    /// Şifre
    public static let passwordPlaceHolder = L10n.tr("Localizable", "Login.passwordPlaceHolder")
    /// Giriş Yap
    public static let title = L10n.tr("Localizable", "Login.title")
    /// Kullanıcı adı
    public static let usernamePlaceHolder = L10n.tr("Localizable", "Login.usernamePlaceHolder")
  }

  public enum Register {
    /// Giriş Yap
    public static let bottomButtonText = L10n.tr("Localizable", "Register.bottomButtonText")
    /// Hesabın mı var?
    public static let bottomLabelText = L10n.tr("Localizable", "Register.bottomLabelText")
    /// Lütfen bilgilerinizi kontrol ediniz.
    public static let checkInformations = L10n.tr("Localizable", "Register.checkInformations")
    /// E-mail Adresi
    public static let emailPlaceHolder = L10n.tr("Localizable", "Register.emailPlaceHolder")
    /// Lütfen boş alanları doldurunuz
    public static let emptyFields = L10n.tr("Localizable", "Register.emptyFields")
    /// Şifre
    public static let passwordPlaceHolder = L10n.tr("Localizable", "Register.passwordPlaceHolder")
    /// Üye Ol
    public static let signUpButtonText = L10n.tr("Localizable", "Register.signUpButtonText")
    /// Üye Ol
    public static let title = L10n.tr("Localizable", "Register.title")
    /// Kullanıcı Adı
    public static let usernamePlaceHolder = L10n.tr("Localizable", "Register.usernamePlaceHolder")
  }
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
