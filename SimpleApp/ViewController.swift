//
//  ViewController.swift
//  SimpleApp
//
//  Created by Rostadhi Akbar, M.Pd on 09/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var email_input: UITextField!
    @IBOutlet var password_input: UITextField!
    @IBOutlet var username_input: UITextField!
    @IBOutlet var login_button: UIButton!
    
    var register_session: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func DoRegister(_ sender: AnyObject) {
        if (login_button.titleLabel?.text == "Test"){
            let preference = UserDefaults.standard
            preference.removeObject(forKey: "")
            RegisterToDo()
        } else {
            register_now(email: email_input.text!, password: password_input.text!, username: username_input.text!)
        }
    }
    func register_now(email: String, password: String, username: String){
        let post_data: NSDictionary = NSMutableDictionary()
        
        post_data.setValue(email, forKey: "email")
        post_data.setValue(password, forKey: "password")
        post_data.setValue(username, forKey: "name")
        
        let url:URL = URL(string: urlRegister)!
        let session = URLSession.shared
        
        let request  = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadRevalidatingCacheData
        
        var paramaterString = ""
        
        for (key, value) in post_data {
            paramaterString = paramaterString + (key as! String) + "=" + (value as! String) + "&"
        }
        
        request.httpBody = paramaterString.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (
            data, response, error) in
            
            guard let _:Data = data, let _:URLResponse = response , error == nil else { return }
            
            let json: Any?
            
            do {
                json = try JSONSerialization.jsonObject(with: data!, options: [])
            } catch {
                return
            }
            
            guard let server_response = json as? NSDictionary else
            {
                return
            }
            if let data_block = server_response["data"] as? NSDictionary
            {
                if let session_data = data_block["session"] as? String
                {
                    self.register_session = session_data
                    
                    let preferences = UserDefaults.standard
                    preferences.set(session_data, forKey: "session")
                    
                    DispatchQueue.main.async(execute: self.RegisterFinish)
                }
            }
            
        })
        task.resume()
    }
    func RegisterFinish() {
        email_input.isEnabled = false
        password_input.isEnabled = false
        username_input.isEnabled = false
        login_button.isEnabled = true


        login_button.setTitle("Test", for: .normal)
    }
    func RegisterToDo() {
        email_input.isEnabled = false
        password_input.isEnabled = false
        username_input.isEnabled = false
        login_button.isEnabled = true


        login_button.setTitle("Test2", for: .normal)
    }

}

