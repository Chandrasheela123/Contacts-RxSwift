//
//  ContactsDetailsViewModel.swift
//  Contacts-RxSwift
//
//  Created by Chandrasheela Hotkar on 27/03/23.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay


class ContactDetailsViewModel{
    static let contactDetailsInstance = ContactDetailsViewModel()
    
    let nameSubject = BehaviorRelay<String?>(value: "")
    let emailSubject = BehaviorRelay<String?>(value: "")
    let phoneNumberSubject = BehaviorRelay<String?>(value: "")
    
    let disposeBag = DisposeBag()
    
    var isValidDetails : Observable<Bool> {
        
        return Observable.combineLatest(nameSubject, emailSubject, phoneNumberSubject){ name, email, phoneNum in
            guard name != nil && email != nil && phoneNum != nil else{
                return false
            }
            
            return name!.validateName() && email!.validateEmail() && phoneNum!.validatePhone()
            
        }
    }
    
}


extension String{
    
    func validateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: self)
    }
    
    func validateName() -> Bool {
        let nameRegex = "^[A-Za-z]{3,30}$"
        let namePredicate = NSPredicate(format:"SELF MATCHES %@", nameRegex)
        return namePredicate.evaluate(with: self)
    }
    
    func validatePhone() -> Bool {
        let phoneRegex = "^[6-9]\\d{9}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: self)
    }
}
