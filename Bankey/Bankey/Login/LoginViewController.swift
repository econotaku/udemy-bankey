//
//  ViewController.swift
//  Bankey
//
//  Created by ECONOTAKU on 11/8/23.
//

import UIKit

class LoginViewController: UIViewController {
  
  let titleLabel = UILabel()
  let subTitleLabel = UILabel()
  
  let loginView = LoginView()
  let signInButton = UIButton(type: .system )
  let errorMessageLabel = UILabel()
  
                //UITextField 클래스의 text 속성은 optional 로 정의되어 있다.
  var username: String? {
    return loginView.usernameTextField.text
  }
  
  var password: String? {
    return loginView.passwordTextField.text
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    style()
    layout()
    
    
  }
  
  
}

extension LoginViewController {
  
  private func style() {
    view.backgroundColor = .systemBackground
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.text = "Bankey"
    titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
    titleLabel.adjustsFontForContentSizeCategory = true
    
    
    subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    subTitleLabel.textAlignment = .center
    subTitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
    subTitleLabel.adjustsFontForContentSizeCategory = true
    subTitleLabel.numberOfLines = 0
    subTitleLabel.text = "Your premium source for all things banking!"
    
    loginView.translatesAutoresizingMaskIntoConstraints = false
    
    signInButton.translatesAutoresizingMaskIntoConstraints = false
    signInButton.configuration = .filled()
    signInButton.configuration?.imagePadding = 8 //for indicator spacing
    signInButton.setTitle("Sign In", for: [])
    signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
    
    errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
    errorMessageLabel.textAlignment = .center
    errorMessageLabel.textColor = .systemRed
    errorMessageLabel.numberOfLines = 0
    errorMessageLabel.isHidden = true
  }
  
  private func layout() {
    view.addSubview(titleLabel)
    view.addSubview(subTitleLabel)
    view.addSubview(loginView)
    view.addSubview(signInButton)
    view.addSubview(errorMessageLabel)
    
    NSLayoutConstraint.activate([
      subTitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
      titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    
    NSLayoutConstraint.activate([
      loginView.topAnchor.constraint(equalToSystemSpacingBelow: subTitleLabel.bottomAnchor, multiplier: 3),
      subTitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
      subTitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
    ])
    
    NSLayoutConstraint.activate([
      loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),                 //multiplier:1 => 8points
      loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2)
    ])
    
    NSLayoutConstraint.activate([
      signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor , multiplier: 2),
      signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
      signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor )
    ])
    
    NSLayoutConstraint.activate([
      errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
      errorMessageLabel.leadingAnchor.constraint(equalTo: loginView .leadingAnchor),
      errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor )
    ])
     
  }
  
}

// MARK: - Actions
extension LoginViewController {
  
  @objc func signInTapped(sender: UIButton) {
    errorMessageLabel.isHidden = true
    login()
  }
  
  private func login() {
    guard let username = username, let password = password else {
      assertionFailure("Username / password should never be nil")
      return
    }
    
    if username.isEmpty || password.isEmpty {
      configureView(withMessage: "Username / password cannot be blank")
      return
    }
    
    if username == "Kevin" && password == "welcome" {
      signInButton.configuration?.showsActivityIndicator = true
    } else {
      configureView(withMessage: "Incorrect username / password")
    }
  }
   
  private func configureView(withMessage message: String) {
    errorMessageLabel.isHidden = false
    errorMessageLabel.text = message
  }
  
}

