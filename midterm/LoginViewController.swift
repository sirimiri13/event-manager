//
//  LoginViewController.swift
//  midterm
//
//  Created by Lam Huong on 11/13/19.
//  Copyright © 2019 Lam Huong. All rights reserved.
//

import Foundation
import UIKit

import SCLAlertView

class LoginViewController: UIViewController {

    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    var username : String = ""
    var pass: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func loginButton(_ sender: Any) {
        let url = URL(string: "https://private-2c2d9d-login549.apiary-mock.com/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let json: [String: Any] = ["login": "request"]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        request.httpBody = jsonData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let dictArray = responseJSON as? [String: Any] {
                for item in dictArray {
                    self.username = item.key
                    self.pass = item.value as! String
                }
                DispatchQueue.main.async(execute: self.Login)
            }
        }

        task.resume()
}
    

    func Login() {
        if (usernameText.text == username && passText.text == pass)
        {
            let story = self.storyboard
            let addView = story?.instantiateViewController(withIdentifier: "ViewMain") as! ViewController
            addView.modalPresentationStyle = .fullScreen
            self.present(addView, animated: false)
        }
        else
        {
            let failedAlert = SCLAlertView()
            failedAlert.showError("Failed", subTitle: "Your username or password is incorrect")
        }
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
