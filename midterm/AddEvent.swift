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
    
    @IBOutlet weak var titleName: UILabel!
    var nameEvent : String = ""
   
    var size : String = "20"
    var color : String = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1).UIColorToString()
    var selectFont : String = "Arial"
    let realm = try! Realm()
    let info = infoEvent()
    //let realmInfo = try! Realm()
       var myGuest = myGuests()
       var listGuest : Results<myGuests>{
           get {
               return realm.objects(myGuests.self)
           }
       }
    
   override func viewDidLoad() {
          super.viewDidLoad()
    //titleName.text = "CREATE NEW EVENT"
    let event = realm.objects(infoEvent.self)
    eventName.text = ""
    textFont.text = selectFont
    sizeFont.text = size
    colorLabel.backgroundColor = .black
   // let event = realm.objects(infoEvent.self)
   /* if (event.count == 0)
    {
        titleName.text = "CREATE NEW EVENT"
    
    }*/
    if (event.count == 0)
    {
        titleName.text = "CREATE NEW EVENT"
        eventName.text = ""
        textFont.text = selectFont
        sizeFont.text = size
        colorLabel.backgroundColor = color.StringToUIColor()
    }
    else
    {
        titleName.text = "EDIT EVENT"
        eventName.text = event[0].name
        textFont.text = event[0].font
        sizeFont.text = event[0].fontSize
        colorLabel.backgroundColor = event[0].fontColor?.StringToUIColor()
       
    }
        self.HiddenKeyBoard()
        recordsList.reloadData()
          // Do any additional setup after loading the view.
      }
    @IBOutlet weak var button: UIButton!
    
    @IBAction func changeFont(_ sender: Any) {
        let fontPicker = UIPickerView()
              fontPicker.delegate = self
              let tempInput = UITextField(frame:CGRect.zero)
              tempInput.inputView = fontPicker
              createToolbar(tempInput)
              self.view.addSubview(tempInput)
              tempInput.becomeFirstResponder()
                
    }
    
    func createToolbar(_ textField: UITextField) {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dissmissKeyboard))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        textField.inputAccessoryView = toolBar
    }
    @objc func dissmissKeyboard() {
           view.endEditing(true)
       }
    // button color
    /*@IBAction func buttonColor(_ sender: Any) {
      
        
    }*/
    
    @IBAction func changeFontButton(_ sender: Any) {
       // self.button.backgroundColor = UIColor(named: "#000000")
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
                      // self..backgroundColor = color         // self.button.backgroundColor = color
                      // self.view.tintColor = color
                      // self.dismissSwitch.onTintColor = color
                       self.navigationItem.rightBarButtonItem?.tintColor = color
                       //self.buttonFontColor.
                       self.colorLabel.backgroundColor = color
                        self.info.fontColor = color?.UIColorToString()
                        //self.info.fontColor = color?.UIColorToString()
                        
           }
    }
    @IBOutlet weak var colorLabel: UILabel!
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
            let temp = Int(size)
        sizeFont.text = String(temp)
       // info.fontSize = String(temp)
        //self.info.fontSize = sizeFont.text
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
       /* let alert = SCLAlertView()
        alert.addButton("OK"){ () -> Void in
        let story = self.storyboard
        let addView = story?.instantiateViewController(withIdentifier: "CreateView") as! CreateView
            self.present(addView, animated: false)
            
                try! self.realm.write {
                self.realm.deleteAll()
        }
        }
        alert.showNotice("Notice", subTitle: "Your event is not created if you exit")*/
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
    print(Realm.Configuration.defaultConfiguration.fileURL)
       let event = realm.objects(infoEvent.self)
        if (event.count == 0) {
            if (eventName.text == ""){
                SCLAlertView().showError("Error", subTitle: "Please enter your event name!!!")
            }
            else {
                let myEvent = infoEvent()
                myEvent.name = eventName.text
                myEvent.fontSize = sizeFont.text
                myEvent.font = textFont.text
                myEvent.fontColor = colorLabel.backgroundColor?.UIColorToString()
                try! realm.write {
                    realm.add(myEvent)
                }
                SCLAlertView().showInfo("Success", subTitle: "Your event has been created!")
                self.dismiss(animated: true, completion: nil)
            }
        }
        else {
            if (eventName.text == ""){
                SCLAlertView().showError("Error", subTitle: "Please enter your event name!")
            }
            else {
                try! realm.write {
                    event[0].name = eventName.text
                    event[0].font = textFont.text
                    event[0].fontSize = sizeFont.text
                    event[0].fontColor = colorLabel.backgroundColor?.UIColorToString()
                    
                }
                SCLAlertView().showSuccess("Success", subTitle: "Your event has been UPDATED!")
                self.dismiss(animated: true, completion: nil)
            }
        }
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


extension AddEvent: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return UIFont.familyNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return UIFont.familyNames[row]
    }
    

    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //textFont.text = UIFont.familyNames[row]
        selectFont = UIFont.familyNames[row]
        textFont.text = selectFont
        textFont.font = UIFont(name: selectFont, size: 16)
        
    }
}

extension UIColor {
    func UIColorToString() -> String {
        let components = self.cgColor.components
        return "[\(components![0]), \(components![1]), \(components![2]), \(components![3])]"
    }
    
}

extension String {
    func StringToUIColor() -> UIColor {
        let componentsString = self.replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
        let components = componentsString.components(separatedBy: ", ")
        return UIColor(red: CGFloat((components[0] as NSString).floatValue),
                     green: CGFloat((components[1] as NSString).floatValue),
                      blue: CGFloat((components[2] as NSString).floatValue),
                     alpha: CGFloat((components[3] as NSString).floatValue))
    }
}
