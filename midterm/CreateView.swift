//
//  CreateView.swift
//  midterm
//
//  Created by Lam Huong on 11/5/19.
//  Copyright © 2019 Lam Huong. All rights reserved.
//

import UIKit
import SCLAlertView
import RealmSwift
class CreateView: UIViewController {
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
      /*  let event = realm.objects(infoEvent.self)
        if (event.count == 0)
            eventName
*/
        
    }
 

    @IBAction func createEvent(_ sender: Any) {
       
        let event = realm.objects(infoEvent.self)
        if ( event.count == 0){
            let story = self.storyboard
            let addView = story?.instantiateViewController(withIdentifier: "AddEvent") as! AddEvent
            addView.modalPresentationStyle = .fullScreen
            self.present(addView, animated: false)
        }
        else {
            let alert = SCLAlertView()
            alert.addButton("OK"){ () -> Void in
            try!  self.realm.write{
                self.realm.deleteAll()
            }
            let story = self.storyboard
            let addView = story?.instantiateViewController(withIdentifier: "AddEvent") as! AddEvent
            addView.modalPresentationStyle = .fullScreen
            self.present(addView, animated: false)
            
          }
    
        alert.showWarning("", subTitle: "Creating new event will delete all the info from the previous or current event in the app")
        }
    }
    
    @IBAction func editEvent(_ sender: Any) {
        let alert = SCLAlertView()
      //  alert.addButton("OK"){ () -> Void in
        let event = realm.objects(infoEvent.self)
              if ( event.count == 0){
                    alert.showInfo("", subTitle: "Your Event is not exist")
              }
              else {
                  
                  let story = self.storyboard
                  let addView = story?.instantiateViewController(withIdentifier: "AddEvent") as! AddEvent
                  addView.modalPresentationStyle = .fullScreen
                  self.present(addView, animated: false)
                  }
                }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    @IBAction func unwindToCreateEvent(segue: UIStoryboardSegue){
        let event = realm.objects(infoEvent.self)
        if (event.count == 0)
        {
            let alert = SCLAlertView()
            alert.showWarning("",subTitle: "Your event is not created")
            try! realm.write {
                realm.deleteAll()
            }
        }
       
      
    }
    @IBAction func saveEvent(segue: UIStoryboardSegue){
    }
}




