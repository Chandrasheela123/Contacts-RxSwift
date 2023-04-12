//
//  CreateContactsViewController.swift
//  Contacts-RxSwift
//
//  Created by Chandrasheela Hotkar on 24/03/23.
//

import UIKit
import RxSwift
import RxCocoa
import CoreData

class CreateContactsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let disposeBag = DisposeBag()

    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var favouriteButton: UISwitch!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var emailIDTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var contactNumberTextField: UITextField!
    @IBOutlet weak var contactNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Home Dir: \(NSHomeDirectory())")
        bindDataToTextFields()
   favSave()
        // Do any additional setup after loading the view.
    }
   
    func bindDataToTextFields() {
        
        contactNameTextField.rx.text.bind(to: ContactDetailsViewModel.contactDetailsInstance.nameSubject).disposed(by: disposeBag)
        
        contactNumberTextField.rx.text.bind(to: ContactDetailsViewModel.contactDetailsInstance.phoneNumberSubject).disposed(by: disposeBag)
        emailIDTextField.rx.text.bind(to: ContactDetailsViewModel.contactDetailsInstance.emailSubject).disposed(by: disposeBag)
        
        
        createButton.rx.tap.flatMap{ data -> Completable in
            
            return AddContactDetails().saveDetails(name: self.contactNameTextField.text!, email: self.emailIDTextField.text!, phoneNum: self.contactNumberTextField.text!, image: self.contactImage.image!)
            
        }.subscribe(onError:{ err in
            print("Error: \(err.localizedDescription)")
        }, onCompleted: {
            print("Data saved")
        })
    }
        func favSave ()
        {
             favouriteButton.rx.isOn.flatMap{ data -> Completable in
                
                return AddContactDetails().saveFavourites(name: self.contactNameTextField.text!, email: self.emailIDTextField.text!, phoneNum: self.contactNumberTextField.text!)

            }.subscribe(onError:{ err in
                print("Error: \(err.localizedDescription)")
            }, onCompleted: {
                print("Data favorite saved")
            })
        }
       //MARK: CHANGE
//        addImageButton.rx.tap.subscribe(onNext: { [weak self] in
//            GalleryManager.galleryInstance.showGallery()
//        })
    
    
    @IBAction func createButton(_ sender: Any) {
        
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "ContactViewController") as! ContactViewController
        self.navigationController?.popViewController(animated: true)

    }
    @IBAction func cancleButton(_ sender: Any) {
    }
    @IBAction func switchButton(_ sender: Any) {
    }
    
    @IBAction func saveImageButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let pikedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            contactImage.image = pikedImage
            AddContactDetails.sharedInstance.selectedImage = pikedImage
            
          //  selectedImage = pikedImage
        }
        dismiss(animated: true, completion: nil)
    }

}
