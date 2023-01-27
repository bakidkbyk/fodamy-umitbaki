//
//  Transition.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 27.01.2023.
//

protocol Transition: AnyObject {
    var viewController: UIViewController? { get set }

    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController)
}
