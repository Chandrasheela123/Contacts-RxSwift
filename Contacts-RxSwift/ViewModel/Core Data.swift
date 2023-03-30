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
    let detailContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func saveDetails(name: String, email : String, phoneNum: String) -> Completable{
        
        return Completable.create{ _ in
            
            
      
            let detail =  ContactDetailsEntity(context: self.detailContext) // ContactDetails(context: self.detailContext)

            detail.name = name
            detail.emailID = email
            detail.phoneNumber = phoneNum
            
           
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
    
//    func getDetails() -> [ContactDetailsEntity]{
//        let fReq : NSFetchRequest<ContactDetailsEntity> = ContactDetailsEntity.fetchRequest()
//        do{
//            let detailList = try detailContext.fetch(fReq)
//            return detailList
//        }
//        catch{
//            print("Unable to load : \(error.localizedDescription)")
//        }
//        return []
//    }


}


