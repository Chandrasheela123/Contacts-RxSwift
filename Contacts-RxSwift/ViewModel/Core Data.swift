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
    
    let detailContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func saveDetails(name: String, email : String, phoneNum: String) -> Completable{
        
        return Completable.create{ _ in
            
            
            
            let detail = ContactDetails(context: self.detailContext)

            detail.name = name
            detail.emailID = email
            detail.phoneNumber = Int32(phoneNum) ?? 0
           
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
    
    
    func getDetails() -> [ContactDetails]{
        let fReq : NSFetchRequest<ContactDetails> = ContactDetails.fetchRequest()
        do{
            let detailList = try detailContext.fetch(fReq)
            return detailList
        }
        catch{
            print("Unable to load : \(error.localizedDescription)")
        }
        return []
    }


}


