//
//  Closures.swift
//  Utilities
//
//  Created by Baki Dikbıyık on 4.01.2023.
//
import UIKit
import SKPhotoBrowser

public typealias VoidClosure   = (() -> Void)
public typealias StringClosure = ((String) -> Void)
public typealias IntClosure = ((Int) -> Void)
public typealias FavoritesClosure = ((Int, String) -> Void)
public typealias IndexPathClosure = ((IndexPath) -> Void)
public typealias SkPhotoBrowserClosure = ((SKPhotoBrowser) -> Void)
