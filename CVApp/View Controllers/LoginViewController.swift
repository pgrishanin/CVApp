//
//  ViewController.swift
//  CVApp
//
//  Created by pavel on 23.10.2020.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        guard let destinationVC = tabBarController.viewControllers?.first
                                  as? WelcomeViewController
        else { return }
        
        destinationVC.set(user: user)
    }
    
    @IBAction func loginClick(_ sender: UIButton) {
        submitForm()
    }
    
    private func submitForm() {
        user = User(
            name: userNameTextField.text ?? "",
            password: passwordTextField.text ?? ""
        )
        
        if user.isValid() {
            navigateToWelcomeView()
        } else {
            clearPasswordField()
            showAlert(with: "Invalid username or password")
        }
    }
    
    @IBAction func showForgottenInfo(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            showAlert(with: "User Name is", and: "User")
        case 1:
            showAlert(with: "Password is", and: "password")
        default:
            break
        }
    }
}

extension LoginViewController {
    private func showAlert(with title: String, and message: String = "") {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func clearPasswordField() {
        passwordTextField.text = nil
    }
    
    private func navigateToWelcomeView() {
        performSegue(withIdentifier: "welcomeViewSegue", sender: nil)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            submitForm()
        default:
            break
        }
        
        return false
    }
}
