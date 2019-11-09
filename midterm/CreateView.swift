//
//  CreateView.swift
//  midterm
//
//  Created by Lam Huong on 11/5/19.
//  Copyright © 2019 Lam Huong. All rights reserved.
//

import UIKit
import SCLAlertView
class CreateView: UIViewController {
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 

    @IBAction func createEvent(_ sender: Any) {
        let alert = SCLAlertView()
        alert.addButton("OK"){ () -> Void in
          let story = self.storyboard
          let addView = story?.instantiateViewController(withIdentifier: "AddEvent") as! AddEvent
            self.present(addView, animated: false)
          /*  try! realm.write {
                            realm.deleteAll()
                          }*/
          }
        /*alert.addButton("Cancel"){ () -> Void in
        }*/
        alert.showInfo("", subTitle: "Creating new event will delete all the info from the previous or current event in the app")
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    @IBAction func unwindToCreateEvent(segue: UIStoryboardSegue){}
}


