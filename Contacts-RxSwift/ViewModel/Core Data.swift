//
//  Core Data.swift
//  Contacts-RxSwift
//
//  Created by prama niyogi on 24/03/23.
//

import Foundation
import CoreData
import RxCocoa
import RxSwift
import UIKit


class AddContactDetails{
    
    static let sharedInstance = AddContactDetails()
   
    var selectedImage: UIImage?
 
    let detailContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   
    func saveDetails(name: String, email : String, phoneNum: String, image: UIImage) -> Completable{
        
        return Completable.create{ completable in
            guard let imageData = image.jpegData(compressionQuality: 1.0), let pngData = image.pngData() else {
                completable(.error(NSError(domain: "com.example.app", code: -1, userInfo: [NSLocalizedDescriptionKey: "fail to get img"])))
                return Disposables.create()
            }

      
            let detail =  ContactDetailsEntity(context: self.detailContext)

            detail.name = name
            detail.emailID = email
            detail.phoneNumber = phoneNum
            detail.savedImage = pngData
        
            do{
                try self.detailContext.save()
                print("Details added")
            }
            catch{
                print("Unable to add details: \(error.localizedDescription)")
                self.detailContext.delete(detail)
            }
            
            return Disposables.create()
        }
        
    }
    
    func fetchDetails() -> Observable<[ContactDetailsEntity]>{
        return Observable<[ContactDetailsEntity]>.create{ observer -> Disposable in
            
            let fReq : NSFetchRequest<ContactDetailsEntity> = ContactDetailsEntity.fetchRequest()
            do{
                let detailList = try self.detailContext.fetch(fReq)
                observer.onNext(detailList)
                //return detailList
            }
            catch{
                print("Unable to load : \(error.localizedDescription)")
            }
            return Disposables.create {
                
            }
        }
            
        }
    
    func saveFavourites(name: String, email : String, phoneNum: String) -> Completable{
        
        return Completable.create{ completable in
//            guard let imageData = image.jpegData(compressionQuality: 1.0), let pngData = image.pngData() else {
//                completable(.error(NSError(domain: "com.example.app", code: -1, userInfo: [NSLocalizedDescriptionKey: "fail to get img"])))
//                return Disposables.create()
//            }
            
      
            let favourite =  Favourites(context: self.detailContext) // ContactDetails(context: self.detailContext)

            favourite.name = name
            favourite.email = email
            favourite.phone = phoneNum
        //    favourite.favImage = pngData
           
            do{
                try self.detailContext.save()
                print("favourites added")
            }
            catch{
                print("Unable to add details: \(error.localizedDescription)")
                self.detailContext.delete(favourite)
            }
            
            return Disposables.create()
        }
        
    }
    
    func fetchFavourites() -> Observable<[Favourites]>{
        return Observable<[Favourites]>.create{ observer -> Disposable in
            
            let fReq : NSFetchRequest<Favourites> = Favourites.fetchRequest()
            do{
                let favList = try self.detailContext.fetch(fReq)
                observer.onNext(favList)
                //return detailList
            }
            catch{
                print("Unable to load : \(error.localizedDescription)")
            }
            return Disposables.create {
                
            }
        }
            
        }


}


