//
//  Login.swift
//  journal
//
//  Created by Allen Wu on 12/2/22.
//

import UIKit

class Login: Overlay {
    
    let text = UILabel()
    let box = UIImage(named: "loginBox")
    let username = UITextField()
    let password = UITextField()
    
    let login = UIButton()
    let signUp = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        text.text = "login"
        
        text.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(text)
        
        text.snp.makeConstraints { make -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.leading.equalToSuperview()
        }
        
        setUpFields()
        setUpLogin()
        setUpSignUp()
        setUpConstraints()

        // Do any additional setup after loading the view.
    }
    
    func setUpFields() {
        username.placeholder = "username"
        username.background = box
        
        password.placeholder = "password"
        password.background = box
        
        username.translatesAutoresizingMaskIntoConstraints = false
        password.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(username)
        view.addSubview(password)
    }
    
    func setUpLogin() {
        login.setTitle("login", for: .normal)
        login.setBackgroundImage(UIImage(named: "button border"), for: .normal)
        login.addTarget(self, action: #selector(newLogin), for: .touchUpInside)
        login.titleLabel?.textColor = .black
        
        login.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(login)
    }
    
    func setUpSignUp() {
        signUp.setTitle("sign up", for: .normal)
        signUp.setBackgroundImage(UIImage(named: "button border"), for: .normal)
        signUp.addTarget(self, action: #selector(signUps), for: .touchUpInside)
        
        signUp.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUp)
    }
    
    @objc
    func signUps() {
        text.text = "sign up"
        signUp.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
    }
    
    @objc
    func createAccount() {
        if (username.text == "" || password.text == "") {
            return
        }
        NetworkManager.register(username: username.text ?? "", password: password.text ?? "") { user in
            NetworkManager.auth = "Bearer \(user.session_token)"
        }
        navigationController?.setViewControllers([HomePageViewController()], animated: true)
    }
    
    @objc
    func newLogin() {
        NetworkManager.login(username: username.text ?? "", password: password.text ?? "") { user in
            NetworkManager.auth = "Bearer \(user.session_token)"
        }
        navigationController?.setViewControllers([HomePageViewController()], animated: true)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            username.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            username.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            password.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            password.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 12),
        ])
        
        NSLayoutConstraint.activate([
            login.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 70),
            login.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10),
            login.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            login.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
        
        NSLayoutConstraint.activate([
            signUp.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -70),
            signUp.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10),
            signUp.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            signUp.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
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
//
//struct
