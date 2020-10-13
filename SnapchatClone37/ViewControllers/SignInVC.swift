//
//  ViewController.swift
//  SnapchatClone37
//
//  Created by Luke Martin-Resnick on 10/2/20.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func signInTapped(_ sender: Any) {
        if passwordTextfield.text != "" && emailTextfield.text != "" {
            
            Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (auth, error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        } else {
            makeAlert(title: "Error", message: "Email/Password ?")
        }
        
        
        
        
        
    }
    @IBAction func signUpTapped(_ sender: Any) {
        
        if usernameTextfield.text != "" && passwordTextfield.text != "" && emailTextfield.text != "" {
            
            Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (auth, error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                } else {
                    
                    let fireStore = Firestore.firestore()
                    
                    let userDictionary = ["email" : self.emailTextfield.text!, "username" : self.usernameTextfield.text!] as [String : Any]
                    
                    fireStore.collection("UserInfo").addDocument(data: userDictionary) { (error) in
                        if error != nil {
                            
                        }
                    }
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        } else {
            makeAlert(title: "Error", message: "Username/Password/Email ?")
            
        }
    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    

}

