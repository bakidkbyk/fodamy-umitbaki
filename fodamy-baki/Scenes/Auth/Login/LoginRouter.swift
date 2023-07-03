//
//  LoginRouter.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 27.01.2023.
//

final class LoginRouter: Router, LoginRouter.Routes {
    
    typealias Routes = RegisterRoute & ForgotPasswordRoute & HomePlaceOnWindowRoute & RecipesRoute
}
