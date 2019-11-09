//
//  AddEvent.swift
//  midterm
//
//  Created by Lam Huong on 11/5/19.
//  Copyright © 2019 Lam Huong. All rights reserved.
//
				
import UIKit
import RealmSwift
class AddEvent: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
        let realm = try! Realm()
    var myGuest = myGuests()
    var listGuest : Results<myGuests>{
        get {
            return realm.objects(myGuests.self)
        }
    }
    

    @IBOutlet weak var recordsList: UITableView!
    
    @IBOutlet weak var buttonFontColor: UIButton!
    @IBOutlet weak var sizeFont: UILabel!
    @IBOutlet weak var sliderSizeFont: UISlider!
    @IBOutlet weak var textFont: UILabel!
    @IBOutlet weak var buttonFont: UIButton!
    @IBOutlet weak var eventName: UITextField!
    @IBAction func changeSizeFont(_ sender: Any) {
        let size = sliderSizeFont.value
        sizeFont.text = String(size)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //  super.viewDidLoad()
          /*let Huong = myGuests()
        Huong.firstName = "Lam"
        Huong.lastName = "Huong"
        Huong.guest = "2"
        Huong.table = "1"
        Huong.section = "A"
        
        try! realm.write {
            realm.add(Huong)
        }
        print(realm.objects(myGuests.self))*/
        //myGuest.add
        
       // tableView.dataSource = self
        //tableView.delegate = self
       
        recordsList.reloadData()
        // Do any additional setup after loading the view.
    }
   func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listGuest.count
       }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
           let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyCell
            
       let item = listGuest[indexPath.row]
        
        
        cell1.nameText.text = item.firstName
        cell1.lastName.text = item.lastName
        cell1.guest.text = item.guest
        
        cell1.table.text = item.table
        cell1.section.text = item.section
       // recordsList.reloadData()
         return cell1
       }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

    
    @IBAction func unwindToAddGuest(segue: UIStoryboardSegue){}
        
    
  @IBAction func AddEvent(segue: UIStoryboardSegue){
    guard let guest = segue.source as? CreateGuest else {return}
    guard let fName = guest.firstName.text, let lName = guest.lastName.text, let guests = guest.tableText.text, let table = guest.tableText.text, let section = guest.sectionText.text else {return}
             let newGuest = myGuests()
        newGuest.firstName = fName
        newGuest.lastName = lName
        newGuest.guest = guests
        newGuest.table = table
        newGuest.section = section
        recordsList.reloadData()
}

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {}
}
