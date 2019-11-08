//
//  CreateGuest.swift
//  midterm
//
//  Created by Lam Huong on 11/5/19.
//  Copyright © 2019 Lam Huong. All rights reserved.
//

import UIKit

class CreateGuest: UIViewController, UITextViewDelegate {
    var indexPathForGuest : IndexPath? = nil
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var sectionText: UITextField!
    @IBOutlet weak var tableText: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var guestText: UITextField!
   
   
    
    var guest : Guests? = nil
    
    
    	
    override func viewDidLoad() {
          super.viewDidLoad()
        firstName.text = guest?.fristName
        lastName.text = guest?.lastName
        guestText.text = guest?.guest
        tableText.text = guest?.table
        sectionText.text = guest?.section
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

