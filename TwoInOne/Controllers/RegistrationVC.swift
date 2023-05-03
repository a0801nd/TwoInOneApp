import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore

class RegistrationVC: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.isEnabled = false
        registerButton.isEnabled = false
        K.fillTextField(textField: emailField, content: "Email")
        K.fillTextField(textField: passwordField, content: "Password")
    }
    
    // MARK: - IBAction
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let err = error {
                    print(err.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "FromRegisterToMain", sender: self)
                }
            }
        }
    }
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let err = error {
                    print(err.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "FromRegisterToMain", sender: self)
                }
            }
        }
    }

    @IBAction func passwordTFieldChanged(_ sender: UITextField) {
        if sender.text!.count < 6 {
            passwordField.placeholder = "More than 6 ch."
        } else {
            loginButton.isEnabled = true
            registerButton.isEnabled = true
            loginButton.backgroundColor = UIColor.systemIndigo
            registerButton.backgroundColor = UIColor.systemIndigo
        }
    }
}
// MARK: - Extension

extension RegistrationVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordField.endEditing(true)
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        emailField.text = ""
        passwordField.text = ""
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if passwordField.text != "" {
            return true
        } else {
            passwordField.placeholder = "Type something"
            return false
        }
    }
}

