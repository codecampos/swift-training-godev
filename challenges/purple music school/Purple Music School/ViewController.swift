//
//  ViewController.swift
//  iOSLoginScreen
//
//  Created by Idwall Go Dev 013 on 13/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var autenticatorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func autenticator(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
        let user = "devcodecampos@gmail.com"
        let pass = "12345678"
            
        if(email.isValidEmail()){
            if(user == email && pass == password){
        
                let alert = UIAlertController(title: "Seja Bem vindo", message: "Autenticação realizada com sucesso", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction.init(title: "Confirmar", style: .default, handler: { action in
                    print("Cliquei no confirmar")
                }))
                
                    present(alert, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Login Incorreto", message: "Erro na autenticação, tentar novamente", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction.init(title: "Confirmar", style: .default, handler: { action in
                print("Cliquei no confirmar")
            }))
            
                present(alert, animated: true, completion: nil)
        }
        } else {
            let alert = UIAlertController(title: "Login Incorreto", message: "Erro na autenticação, tentar novamente", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction.init(title: "Confirmar", style: .default, handler: { action in
                print("Cliquei no confirmar")
            }))
            
                present(alert, animated: true, completion: nil)
        }
        }
    }
    }

extension String {
    
    func isValidEmail() -> Bool {
        let emailRegularExpression = "[A-Z0-9a-z.-_]+@[A-Z0-9a-z-_.]+\\.[A-Za-z]{2,6}"
        let result: Bool = NSPredicate(format: "SELF MATCHES %@", emailRegularExpression).evaluate(with: self)
        return result
    }
}

