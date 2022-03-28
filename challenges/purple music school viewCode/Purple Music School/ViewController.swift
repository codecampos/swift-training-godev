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
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var secondContentVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .white
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 5
        stack.contentMode = .scaleToFill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var contentHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.backgroundColor = .white
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 0
        stack.contentMode = .scaleToFill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var logoTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .justified
        label.text = "Boas Vindas!"
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var secondLogoTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .justified
        label.text = "Vamos fazer música juntos"
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emailTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "E-mail"
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var passwordTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Senha"
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.tintColor = .systemGray
        email.placeholder = "Informe seu e-mail"
        email.font = UIFont.systemFont(ofSize: 14)
        email.borderStyle = .roundedRect
        email.textContentType = .emailAddress
        email.autocorrectionType = .no
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.tintColor = .systemGray
        password.placeholder = "Informe sua senha"
        password.font = UIFont.systemFont(ofSize: 14)
        password.borderStyle = .roundedRect
        password.textContentType = .password
        password.isSecureTextEntry = true
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    lazy var autenticatorButton: UIButton = {
        let button = UIButton()
        
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.443, green: 0.345, blue: 0.657, alpha: 1.0)
        button.setTitle("Entrar", for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(autenticator), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var resetPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(red: 0.443, green: 0.345, blue: 0.657, alpha: 1.0), for: .normal)
        button.setTitle("Esqueci minha senha", for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(red: 0.443, green: 0.345, blue: 0.657, alpha: 1.0), for: .normal)
        button.setTitle("Não tem uma conta?", for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var helpButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(red: 0.443, green: 0.345, blue: 0.657, alpha: 1.0), for: .normal)
        button.setTitle("Ajuda", for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 15)
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
            contentVerticalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            contentVerticalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentVerticalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        
        contentVerticalStack.addArrangedSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        contentVerticalStack.addArrangedSubview(logoTitleLabel)
        contentVerticalStack.addArrangedSubview(secondLogoTitleLabel)
        
        view.addSubview(secondContentVerticalStack)
        
        NSLayoutConstraint.activate([
            secondContentVerticalStack.topAnchor.constraint(equalTo: contentVerticalStack.bottomAnchor, constant: 16),
            secondContentVerticalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            //secondContentVerticalStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 16),
            secondContentVerticalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        secondContentVerticalStack.addArrangedSubview(emailTitleLabel)
        secondContentVerticalStack.addArrangedSubview(emailTextField)
        secondContentVerticalStack.addArrangedSubview(passwordTitleLabel)
        secondContentVerticalStack.addArrangedSubview(passwordTextField)
        
        view.addSubview(autenticatorButton)
        
        NSLayoutConstraint.activate([
            autenticatorButton.topAnchor.constraint(equalTo: secondContentVerticalStack.bottomAnchor, constant: 16),
            autenticatorButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            autenticatorButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(resetPasswordButton)
        
        NSLayoutConstraint.activate([
            resetPasswordButton.topAnchor.constraint(equalTo: autenticatorButton.bottomAnchor, constant: 30),
            resetPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            resetPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(contentHorizontalStack)
        
        NSLayoutConstraint.activate([
            contentHorizontalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentHorizontalStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            contentHorizontalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        contentHorizontalStack.addArrangedSubview(signUpButton)
        contentHorizontalStack.addArrangedSubview(helpButton)
        
    }
}



extension String {
    
    func isValidEmail() -> Bool {
        let emailRegularExpression = "[A-Z0-9a-z.-_]+@[A-Z0-9a-z-_.]+\\.[A-Za-z]{2,6}"
        let result: Bool = NSPredicate(format: "SELF MATCHES %@", emailRegularExpression).evaluate(with: self)
        return result
    }
}

