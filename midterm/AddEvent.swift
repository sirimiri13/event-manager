//
//  AddEvent.swift
//  midterm
//
//  Created by Lam Huong on 11/5/19.
//  Copyright © 2019 Lam Huong. All rights reserved.
//
				
import UIKit
class AddEvent: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    var myGuest: [Guests] = []
  //  let tab : UITableView
    //var tableView : UITableView!

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
           let Huong = Guests(fristName: "Huong", lastName: "Lam", guest: "2", table: "1", section: "A")
        myGuest.append(Huong)
       // tableView.dataSource = self
        //tableView.delegate = self
       
        recordsList.reloadData()
        // Do any additional setup after loading the view.
    }
   func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return myGuest.count
       }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyCell
           let guests = myGuest[indexPath.row]
           let fullname = "\(guests.fristName), \(guests.lastName)"
           cell1.nameText.text = fullname
           cell1.guest.text = guests.guest
           cell1.table.text = guests.table
           cell1.section.text = guests.section
           
           // Configure the cell...
            
           return cell1    }

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
             let newGuest = Guests(fristName: fName, lastName: lName, guest: guests, table: table, section: section)
                    if let indexPath = guest.indexPathForGuest {
                        myGuest[indexPath.row] = newGuest
                    }
                    else {
                     myGuest.append(newGuest)
                    }
        recordsList.reloadData()
}

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {}
}
