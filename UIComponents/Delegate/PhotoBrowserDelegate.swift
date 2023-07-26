//
//  SKPhotoBrowserDelegate.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 25.07.2023.
//

import SKPhotoBrowser

final class PhotoBrowserDelegate: SKPhotoBrowserDelegate {
    
    var showPhotoIndex: IntClosure?
    
    func didShowPhotoAtIndex(_ browser: SKPhotoBrowser, index: Int) {
        showPhotoIndex?(index)
    }
}
