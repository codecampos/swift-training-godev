//
//  ViewController.swift
//  iOSLoginScreen
//
//  Created by Idwall Go Dev 013 on 27/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var logoImageView: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.image = UIImage(named: "logo")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    lazy var contentVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .white
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 0
        stack.contentMode = .scaleToFill
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var secondContentVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .white
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 0
        stack.contentMode = .scaleToFill
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var logoTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Boas Vindas!"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var secondLogoTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Vamos fazer música juntos"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emailTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "E-mail"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var passwordTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Senha"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.tintColor = .systemGray
        email.placeholder = "Informe seu e-mail"
        email.font = UIFont.systemFont(ofSize: 14)
        email.textContentType = .emailAddress
        email.autocorrectionType = .no
        email.translatesAutoresizingMaskIntoConstraints = false
        return emailTextField
    }()
    
    lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.tintColor = .systemGray
        password.placeholder = "Informe sua senha"
        password.font = UIFont.systemFont(ofSize: 14)
        password.textContentType = .password
        password.isSecureTextEntry = true
        password.translatesAutoresizingMaskIntoConstraints = false
        return emailTextField
    }()
    
    lazy var autenticatorButton: UIButton = {
        let button = UIButton()
        
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple
        button.setTitle("Entrar", for: .normal)
        button.addTarget(self, action: #selector(autenticator), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    @objc private func autenticator() {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        view.addSubview(contentVerticalStack)
        
        NSLayoutConstraint.activate([
            contentVerticalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            contentVerticalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentVerticalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        
        contentVerticalStack.addArrangedSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoTitleLabel.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        contentVerticalStack.addArrangedSubview(logoTitleLabel)
        contentVerticalStack.addArrangedSubview(secondLogoTitleLabel)
        
        view.addSubview(secondContentVerticalStack)
        
        NSLayoutConstraint.activate([
            secondContentVerticalStack.topAnchor.constraint(equalTo: contentVerticalStack.bottomAnchor, constant: 70),
            secondContentVerticalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            //secondContentVerticalStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 16),
            secondContentVerticalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        secondContentVerticalStack.addArrangedSubview(emailTitleLabel)
        //contentVerticalStack.addArrangedSubview(autenticatorButton)
    }
}



extension String {
    
    func isValidEmail() -> Bool {
        let emailRegularExpression = "[A-Z0-9a-z.-_]+@[A-Z0-9a-z-_.]+\\.[A-Za-z]{2,6}"
        let result: Bool = NSPredicate(format: "SELF MATCHES %@", emailRegularExpression).evaluate(with: self)
        return result
    }
}

