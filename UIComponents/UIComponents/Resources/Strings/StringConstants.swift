// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  /// Yorum Ekle
  public static let addComment = L10n.tr("Localizable", "addComment")
  /// Lütfen bilgilerinizi kontrol ediniz.
  public static let checkInformations = L10n.tr("Localizable", "checkInformations")
  /// Yorum
  public static let comment = L10n.tr("Localizable", "comment")
  /// Yorumlar
  public static let comments = L10n.tr("Localizable", "comments")
  /// E-mail Adresi
  public static let email = L10n.tr("Localizable", "email")
  /// %@ alanı boş olamaz.
  public static func empty(_ p1: Any) -> String {
    return L10n.tr("Localizable", "empty", String(describing: p1))
  }
  /// Lütfen boş alanları doldurunuz.
  public static let emptyFields = L10n.tr("Localizable", "emptyFields")
  /// Takip Et
  public static let follow = L10n.tr("Localizable", "follow")
  /// Takipçi
  public static let follower = L10n.tr("Localizable", "follower")
  /// Takip Ediliyor
  public static let following = L10n.tr("Localizable", "following")
  /// Vazgeç
  public static let giveUp = L10n.tr("Localizable", "giveUp")
  /// Beğeni
  public static let like = L10n.tr("Localizable", "like")
  /// Giriş Yap
  public static let login = L10n.tr("Localizable", "login")
  /// Şifre
  public static let password = L10n.tr("Localizable", "password")
  /// Tarif
  public static let recipe = L10n.tr("Localizable", "recipe")
  /// Malzemeler
  public static let recipeIngredients = L10n.tr("Localizable", "recipeIngredients")
  /// Yapılışı
  public static let recipeSteps = L10n.tr("Localizable", "recipeSteps")
  /// Lütfen ekranı yukarıdan aşağıya kaydırarak yenileyiniz.
  public static let refreshFromTop = L10n.tr("Localizable", "refreshFromTop")
  /// Üye Ol
  public static let register = L10n.tr("Localizable", "register")
  /// Kullanıcı Adı
  public static let username = L10n.tr("Localizable", "username")

  public enum Action {
    /// Block
    public static let block = L10n.tr("Localizable", "Action.block")
    /// Giriş yapmanız gereklidir.
    public static let loginWarning = L10n.tr("Localizable", "Action.loginWarning")
  }

  public enum Comment {
    /// Bir şeyler yazın..
    public static let placeholder = L10n.tr("Localizable", "Comment.placeholder")
  }

  public enum CommentEditController {
    /// Kaydet
    public static let save = L10n.tr("Localizable", "CommentEditController.save")
    /// YORUM DÜZENLE
    public static let title = L10n.tr("Localizable", "CommentEditController.title")
  }

  public enum CommentListController {
    /// YORUMLAR
    public static let title = L10n.tr("Localizable", "CommentListController.title")
  }

  public enum Favorites {
    /// TÜMÜNÜ GÖR
    public static let seeAllButtonTitle = L10n.tr("Localizable", "Favorites.seeAllButtonTitle")
  }

  public enum Home {
    /// EDİTÖR SEÇİMİ
    public static let editorChoiceRecipes = L10n.tr("Localizable", "Home.editorChoiceRecipes")
    /// SON EKLENENLER
    public static let lastAddedRecipes = L10n.tr("Localizable", "Home.lastAddedRecipes")
    /// %@ Yorum %@ Beğeni
    public static func recipeCommnetAndLikeCount(_ p1: Any, _ p2: Any) -> String {
      return L10n.tr("Localizable", "Home.recipeCommnetAndLikeCount", String(describing: p1), String(describing: p2))
    }
    /// %@ Tarif %@ Takipçi
    public static func userRecipeAndFollowerCount(_ p1: Any, _ p2: Any) -> String {
      return L10n.tr("Localizable", "Home.userRecipeAndFollowerCount", String(describing: p1), String(describing: p2))
    }
  }

  public enum Key {
    /// Yorum
    public static let comment = L10n.tr("Localizable", "Key.comment")
    /// E-posta
    public static let email = L10n.tr("Localizable", "Key.email")
    /// Username
    public static let username = L10n.tr("Localizable", "Key.username")
  }

  public enum LoginViewController {
    /// Hesabın mı yok?
    public static let bottomText = L10n.tr("Localizable", "LoginViewController.bottomText")
    /// Şifrenizi mi unuttunuz?
    public static let forgotPassword = L10n.tr("Localizable", "LoginViewController.forgotPassword")
    /// Giriş Yap
    public static let title = L10n.tr("Localizable", "LoginViewController.title")
  }

  public enum PasswordResetController {
    /// Sıfırla
    public static let reset = L10n.tr("Localizable", "PasswordResetController.reset")
    /// Şifre Sıfırlama
    public static let title = L10n.tr("Localizable", "PasswordResetController.title")
  }

  public enum RecipeDetail {
    /// Henüz yorum yapılmamıştır.
    public static let noComment = L10n.tr("Localizable", "RecipeDetail.noComment")
  }

  public enum RegisterViewController {
    /// Hesabın mı var?
    public static let bottomText = L10n.tr("Localizable", "RegisterViewController.bottomText")
    /// Üye Ol
    public static let title = L10n.tr("Localizable", "RegisterViewController.title")
  }

  public enum SignIn {
    /// Sign In
    public static let navigationTitle = L10n.tr("Localizable", "SignIn.navigationTitle")
  }

  public enum WalkThrough {
    /// Fodamy is the best place to find your favorite recipes in all around the world.
    public static let descriptionText = L10n.tr("Localizable", "WalkThrough.descriptionText")
    /// Welcome to Fodamy Network!
    public static let firstTitle = L10n.tr("Localizable", "WalkThrough.firstTitle")
    /// Share recipes with others.
    public static let fourthTitle = L10n.tr("Localizable", "WalkThrough.fourthTitle")
    /// İlerle
    public static let next = L10n.tr("Localizable", "WalkThrough.Next")
    /// Finding recipes were not that easy.
    public static let secondTitle = L10n.tr("Localizable", "WalkThrough.secondTitle")
    /// Başla!
    public static let start = L10n.tr("Localizable", "WalkThrough.Start")
    /// Add new recipe.
    public static let thirdTitle = L10n.tr("Localizable", "WalkThrough.thirdTitle")
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
