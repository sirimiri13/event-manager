//
//  CreateGuest.swift
//  midterm
//
//  Created by Lam Huong on 11/5/19.
//  Copyright © 2019 Lam Huong. All rights reserved.
//

import UIKit
import RealmSwift
import SCLAlertView
class CreateGuest: UIViewController, UITextViewDelegate {
    var indexPathForGuest : IndexPath? = nil
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var sectionText: UITextField!
    @IBOutlet weak var tableText: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var guestText: UITextField!

    
      let realm = try! Realm()
    
    	
    override func viewDidLoad() {
          super.viewDidLoad()
        
    //   let guest = myGuests()
        
     
       
       /* firstName.text = guest.firstName
        lastName.text = guest.lastName
        guestText.text
        
        try! realm.write {
            realm.add(guest)
        }
        print(realm.objects(myGuests.self))*/
        self.HiddenKeyBoard()
    
    
                // Do any additional setup after loading the view.
    }
    
    @objc func dissmissKeyboard() {
              view.endEditing(true)
          }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
    @IBAction func addGuest(_ sender: Any) {
        let alert = SCLAlertView()
        if (firstName.text == "" || lastName.text == "" || guestText.text == "" || tableText.text == "" || sectionText.text == "") {
            alert.showError("Error", subTitle: "Please complete information")
        }
        else {
            let guest = myGuests()
            guest.firstName = firstName.text
            guest.lastName = lastName.text
            guest.guest = guestText.text
            guest.table = tableText.text
            guest.section = sectionText.text
            try! realm.write{
                realm.add(guest)
            }
            print(realm.objects(myGuests.self))
        }
    }
}
extension CreateGuest{
    func HiddenKeyBoard(){
        
        let Tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(textDismissKeyboard))
        view.addGestureRecognizer(Tap)
    }
    @objc func textDismissKeyboard(){
        view.endEditing(true)
    }
}

