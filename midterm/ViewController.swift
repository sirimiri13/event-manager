//
//  ViewController.swift
//  midterm
//
//  Created by Lam Huong on 10/26/19.
//  Copyright © 2019 Lam Huong. All rights reserved.
//

import UIKit
import SCLAlertView
import RealmSwift


class ViewController: UIViewController {
    let realm = try! Realm()
    @IBOutlet weak var adminButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }

    @IBAction func guestButton(_ sender: Any) {
        let event = realm.objects(infoEvent.self)
        if (event.count == 0)
        {
            let alert = SCLAlertView()
            alert.showNotice("", subTitle: "Event is not exist")
        }
        else {
             let story = self.storyboard
            let addView = story?.instantiateViewController(withIdentifier: "backgroundEvent") as! backgroundEvent
            addView.modalPresentationStyle = .fullScreen
            self.present(addView, animated: false)
        }
    }
    @IBAction func unwindToMain(_ sender: UIStoryboardSegue){}

}

