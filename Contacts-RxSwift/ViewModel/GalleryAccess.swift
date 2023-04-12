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
import CoreData

class GalleryManager {
    
    static let galleryInstance = GalleryManager()
    var imgCon: UIImage?=nil
    
    let selectedImage = PublishSubject<UIImage>()
    func showGallery() {
        let gallery = UIImagePickerController()
        gallery.sourceType = .photoLibrary
        gallery.allowsEditing = false
        
      
        

    }
    
    func saveImage() {
        let appDe = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDe.persistentContainer.viewContext
        let photoObject = NSEntityDescription.insertNewObject(forEntityName: "ContactDetailsEntity", into: context) as! ContactDetailsEntity
        
        photoObject.savedImage = imgCon?.jpegData(compressionQuality: 1) as NSData? as Data?
        
        do {
            try context.save()
            print("Data has been saved")
        } catch {
            print("error ouccur while saving")
        }
        
    }
    
}
