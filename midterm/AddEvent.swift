//
//  AddEvent.swift
//  midterm
//
//  Created by Lam Huong on 11/5/19.
//  Copyright © 2019 Lam Huong. All rights reserved.
//
				
import UIKit
import RealmSwift
import ColorPickTip
import SCLAlertView

class AddEvent: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let info = infoEvent()
    let realm = try! Realm()
    let realmInfo = try! Realm()
       var myGuest = myGuests()
       var listGuest : Results<myGuests>{
           get {
               return realm.objects(myGuests.self)
           }
       }
    
   override func viewDidLoad() {
          super.viewDidLoad()
        self.HiddenKeyBoard()
        recordsList.reloadData()
          // Do any additional setup after loading the view.
      }
    @IBOutlet weak var button: UIButton!
    
// button color
        @IBAction func buttonColor(_ sender: Any) {
        //self.button.backgroundColor = UIColor(named: "#000000")
            let paletteColors = SamplePalettes.getPalettes()
        
    
            let options = ColorPickTip.Options()
       
            let colorPickTipVC = ColorPickTipController(palette: paletteColors, options: options)
            colorPickTipVC.popoverPresentationController?.delegate = colorPickTipVC
            colorPickTipVC.popoverPresentationController?.sourceView = sender as? UIView
            colorPickTipVC.popoverPresentationController?.sourceRect = (sender as AnyObject).bounds
        
        self.present(colorPickTipVC, animated: true, completion: nil)
        
           colorPickTipVC.selected = {
            color, index in
            print("picked color: \(String(describing: color)), index: \(String(describing: index))")
            guard color != nil else {return}
            self.button.backgroundColor = color
            self.view.tintColor = color
           // self.dismissSwitch.onTintColor = color
            self.navigationItem.rightBarButtonItem?.tintColor = color
           // self.info.fontColor = "Defaut"
            
    }
    }
    @IBOutlet weak var recordsList: UITableView!
    @IBOutlet weak var buttonFontColor: UIButton!
    @IBOutlet weak var sizeFont: UILabel!
    @IBOutlet weak var sliderSizeFont: UISlider!
    @IBOutlet weak var textFont: UILabel!
    @IBOutlet weak var buttonFont: UIButton!
    @IBOutlet weak var eventName: UITextField!
    
    // slider font size
    @IBAction func changeSizeFont(_ sender: Any) {
        let size = sliderSizeFont.value
        sizeFont.text = String(size)
       info.fontSize = sizeFont.text
    }
   
    
    // tableview
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
    

 // exit
    @IBAction func exitNewEvent(_ sender: Any) {
        let alert = SCLAlertView()
        alert.addButton("OK"){ () -> Void in
        let story = self.storyboard
        let addView = story?.instantiateViewController(withIdentifier: "CreateView") as! CreateView
            self.present(addView, animated: false)
            
                try! self.realm.write {
                self.realm.deleteAll()
        }
        }
        alert.showNotice("Notice", subTitle: "Your event is not created if you exit")
    }
    
    
    @IBAction func unwindToAddGuest(segue: UIStoryboardSegue){}
        // add guest vào event
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

  /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    }*/
    
    
    //save event
  @IBAction func saveEvent(_ sender: Any) {
        info.name = eventName.text
        try! realmInfo.write {
            realmInfo.add(info)
        }
    print(realmInfo.objects(infoEvent.self))
    }
    
}

// ẩn bàn phím
extension AddEvent{
    func HiddenKeyBoard(){
        
        let Tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(textDismissKeyboard))
        view.addGestureRecognizer(Tap)
    }
    @objc func textDismissKeyboard(){
        view.endEditing(true)
    }
}

