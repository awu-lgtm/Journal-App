//
//  Login.swift
//  journal
//
//  Created by Allen Wu on 12/2/22.
//

import UIKit

class Login: UIViewController {
    
    let text = UILabel()
    let box = UIImage(named: "loginBox")
    let username = UITextField()
    let password = UITextField()
    
    let login = UIButton()
    let signUp = UIButton()
    
    public var auth = "bearer "

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
        login.setImage(UIImage(named: "button border"), for: .normal)
        login.addTarget(self, action: #selector(newLogin), for: .touchUpInside)
    }
    
    func setUpSignUp() {
        signUp.setTitle("sign up", for: .normal)
        signUp.setImage(UIImage(named: "button border"), for: .normal)
    }
    
    @objc
    func signUps() {
        text.text = "sign up"
        signUp.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
    }
    
    @objc
    func createAccount() {
        
    }
    
    @objc
    func newLogin() {
        
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
