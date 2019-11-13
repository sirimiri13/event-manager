//
//  InfoGuestViewController.swift
//  midterm
//
//  Created by Lam Huong on 11/13/19.
//  Copyright © 2019 Lam Huong. All rights reserved.
//

import UIKit
import RealmSwift

class SameTableCell: UITableViewCell {
    @IBOutlet weak var guestNameLabel: UILabel!
    @IBOutlet weak var guestsLabel: UILabel!
    
    func setGuest(guest: myGuests){
        guestNameLabel.text = "\(guest.lastName ?? "") \(guest.firstName ?? "")"
        guestsLabel.text = guest.guest
    }
}

class InfoGuestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let list = realm.objects(myGuests.self).filter("table = '\(tableNumber)'")
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let list = realm.objects(myGuests.self).filter("table = '\(tableNumber)'")
        let guest = list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "sameTableCell", for: indexPath) as! SameTableCell
        cell.setGuest(guest: guest)
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableNumberLabel: UILabel!
    @IBOutlet weak var guestsLabel: UILabel!
    @IBOutlet weak var sectionLabel: UILabel!
    
    let realm = try! Realm()
    var firstName: String = ""
    var lastName: String = ""
    var tableNumber: String = ""
    var guests: String = ""
    var guestSection: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let event = realm.objects(infoEvent.self)
        nameLabel.text = "\(lastName) \(firstName)"
        nameLabel.font = UIFont(name: event[0].font!, size: CGFloat((event[0].fontSize! as NSString).integerValue))
        nameLabel.textColor = event[0].fontColor!.StringToUIColor()
        tableNumberLabel.text = tableNumber
        guestsLabel.text = guests
        sectionLabel.text = guestSection
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
        // Do any additional setup after loading the view.
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
