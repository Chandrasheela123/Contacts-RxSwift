//
//  GalleryAccess.swift
//  Contacts-RxSwift
//
//  Created by prama niyogi on 05/04/23.
//

import Foundation
import Photos
import UIKit
import RxSwift
import RxCocoa

class GalleryManager {
    
    static let galleryInstance = GalleryManager()
    
    let selectedImage = PublishSubject<UIImage>()
    func showGallery() {
        let gallery = UIImagePickerController()
        gallery.sourceType = .photoLibrary
        gallery.allowsEditing = false
        
        UIApplication.shared.windows.first?.rootViewController?.present(gallery, animated: true)
        
//        gallery.rx.didFinishPickingMediaWithInfo.take(1).map { info in
//            return info[.originalImage] as? UIImage
//        }
    }
}
