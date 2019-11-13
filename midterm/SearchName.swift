//
//  SearchName.swift
//  midterm
//
//  Created by Lam Huong on 11/12/19.
//  Copyright © 2019 Lam Huong. All rights reserved.
//

import UIKit
import RealmSwift
import SCLAlertView
class SearchName: UIViewController {
    var select : String = ""

    let realm = try! Realm()
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var buttonE: UIButton!
    @IBOutlet weak var buttonG: UIButton!
    @IBOutlet weak var buttonH: UIButton!
    @IBOutlet weak var buttonI: UIButton!
    @IBOutlet weak var buttonT: UIButton!
    @IBOutlet weak var buttonW: UIButton!
    
    @IBOutlet weak var buttonZ: UIButton!
    @IBOutlet weak var buttonY: UIButton!
    @IBOutlet weak var buttonX: UIButton!
    @IBOutlet weak var buttonV: UIButton!
    @IBOutlet weak var buttonU: UIButton!
    @IBOutlet weak var buttonS: UIButton!
    @IBOutlet weak var buttonR: UIButton!
    @IBOutlet weak var buttonQ: UIButton!
    @IBOutlet weak var buttonP: UIButton!
    @IBOutlet weak var buttonO: UIButton!
    @IBOutlet weak var buttonN: UIButton!
    @IBOutlet weak var buttonM: UIButton!
    @IBOutlet weak var buttonL: UIButton!
    @IBOutlet weak var buttonK: UIButton!
    @IBOutlet weak var buttonF: UIButton!
    @IBOutlet weak var buttonJ: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonA.layer.cornerRadius = 10
        buttonB.layer.cornerRadius = 10
        buttonC.layer.cornerRadius = 10
        buttonD.layer.cornerRadius = 10
        buttonE.layer.cornerRadius = 10
        buttonF.layer.cornerRadius = 10
        buttonG.layer.cornerRadius = 10
        buttonH.layer.cornerRadius = 10
        buttonI.layer.cornerRadius = 10
        buttonJ.layer.cornerRadius = 10
        buttonL.layer.cornerRadius = 10
        buttonK.layer.cornerRadius = 10
        buttonM.layer.cornerRadius = 10
        buttonN.layer.cornerRadius = 10
        buttonO.layer.cornerRadius = 10
        buttonP.layer.cornerRadius = 10
        buttonQ.layer.cornerRadius = 10
        buttonR.layer.cornerRadius = 10
        buttonS.layer.cornerRadius = 10
        buttonT.layer.cornerRadius = 10
        buttonU.layer.cornerRadius = 10
        buttonV.layer.cornerRadius = 10
        buttonW.layer.cornerRadius = 10
        buttonX.layer.cornerRadius = 10
        buttonY.layer.cornerRadius = 10
        buttonZ.layer.cornerRadius = 10
        
        
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0: select = "A"
        case 1: select = "B"
        case 2: select = "C"
        case 3: select = "D"
        case 4: select = "E"
        case 5: select = "F"
        case 6: select = "G"
        case 7: select = "H"
        case 8: select = "I"
        case 9: select = "J"
        case 10: select = "K"
        case 11: select = "L"
        case 12: select = "M"
        case 13: select = "N"
        case 14: select = "O"
        case 15: select = "P"
        case 16: select = "Q"
        case 17: select = "R"
        case 18: select = "S"
        case 19: select = "T"
        case 20: select = "U"
        case 21: select = "V"
        case 22: select = "W"
        case 23: select = "X"
        case 24: select = "Y"
        case 25: select = "Z"

        default:
            select = ""
        }
        let story = self.storyboard
            let addView = story?.instantiateViewController(withIdentifier: "SelectName") as! SelectName
            addView.modalPresentationStyle = .fullScreen
            addView.select = select
            self.present(addView, animated: false)
         
    }
    
    
     @IBAction func unwindToSearchName(_ sender: UIStoryboardSegue){}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
   
}
