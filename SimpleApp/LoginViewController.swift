//
//  LoginViewController.swift
//  SimpleApp
//
//  Created by Rostadhi Akbar, M.Pd on 11/02/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var formLogin = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func confirmLogin(_ sender: Any) {
        let email : String = emailField.text!
        let password : String = passwordField.text!
        
        if email.isEmpty || password.isEmpty {
            print("Email / password is required")
            return
        }
        if (email == "admin@admin.com") && (password == "1234") {
            let alert = UIAlertController(title: "Berhasil", message: "welcome back", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Good", style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "gagal", message: "Email atau password salah", preferredStyle: .alert)
            let action = UIAlertAction(title: "Good", style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
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
