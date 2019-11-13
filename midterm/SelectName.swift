//
//  SelectName.swift
//  midterm
//
//  Created by Lam Huong on 11/12/19.
//  Copyright © 2019 Lam Huong. All rights reserved.
//

import UIKit
import RealmSwift
class SelectName: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    let realm = try! Realm()
    var select : String = ""
  //  @IBOutlet weak var tableName: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(select)
        
        //guard let guest = segue.source as? SearchName else {return}
       // let
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let list = realm.objects(myGuests.self).filter("lastName BEGINSWITH '\(select)'")
        return list.count
       }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = realm.objects(infoEvent.self)
            let list = realm.objects(myGuests.self).filter("lastName BEGINSWITH '\(select)'")
            let guest = list[indexPath.row]
           let cell1 = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
          
            cell1.textLabel?.text = "\(guest.lastName ?? "") , \(guest.firstName ?? "")"
            cell1.textLabel?.font = UIFont(name: event[0].font!, size: CGFloat((event[0].fontSize! as NSString).integerValue))
            cell1.textLabel?.textColor = event[0].fontColor?.StringToUIColor()
         return cell1
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toInfoGuest" {
            guard let vc = segue.destination as? InfoGuestViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let list = realm.objects(myGuests.self).filter("lastName BEGINSWITH '\(select)'")
            let guest = list[indexPath.row]
            vc.lastName = "\(guest.lastName ?? "")"
            vc.firstName = "\(guest.firstName ?? "")"
            vc.tableNumber = guest.table!
            vc.guests = guest.guest!
            vc.guestSection = guest.section!
        }
    }
    
     @IBAction func unwindToSelectName(_ sender: UIStoryboardSegue){}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
