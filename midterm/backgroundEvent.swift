//
//  backgroundEvent.swift
//  midterm
//
//  Created by Lam Huong on 11/12/19.
//  Copyright © 2019 Lam Huong. All rights reserved.
//

import UIKit
import RealmSwift

class backgroundEvent: UIViewController {
    let realm = try! Realm()
   
    @IBOutlet weak var findTableButton: UIButton!
    @IBOutlet weak var titleEventLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let event = self.realm.objects(infoEvent.self)
        titleEventLabel.font = UIFont(name: "Steak", size: 30 )
        findTableButton.layer.cornerRadius = 100
        findTableButton.clipsToBounds = true
        titleEventLabel.font = UIFont(name: event[0].font!, size: CGFloat((event[0].fontSize! as NSString).integerValue))
        titleEventLabel.text = event[0].name
        // Do any additional setup after lading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
