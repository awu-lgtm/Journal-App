//
//  HomePageViewController.swift
//  journal
//
//  Created by Simon Lin on 12/1/22.
//

import UIKit

class HomePageViewController: Overlay {
    
    var profileImageView = UIImageView()
    var titleLabel = UILabel()
    let homeButton = UIButton()
    let loginButton = UIButton()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titleLabel.text = "Remind me to be happy"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 25)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        profileImageView.image = UIImage(named: "smiley")
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 20
        view.addSubview(profileImageView)
        
        homeButton.setTitle("Home Page", for: .normal)
        homeButton.addTarget(self, action: #selector(pushView), for: .touchUpInside)
        homeButton.setTitleColor(.black, for: .normal)
        homeButton.setBackgroundImage(UIImage(named: "Login box"), for: .normal)
        homeButton.layer.cornerRadius = 15
        homeButton.translatesAutoresizingMaskIntoConstraints = false
//        if (NetworkManager.auth == "Bearer ") {
//            homeButton.isHidden = true
//        }
        view.addSubview(homeButton)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(push2View), for: .touchUpInside)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.setBackgroundImage(UIImage(named: "Login box"), for: .normal)
        loginButton.layer.cornerRadius = 15
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        // profileImageView
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImageView.widthAnchor.constraint(equalToConstant: 200),
            profileImageView.heightAnchor.constraint(equalToConstant: 200),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // titleLabel
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            homeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            homeButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            homeButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])

        NSLayoutConstraint.activate([
           loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           loginButton.topAnchor.constraint(equalTo: homeButton.bottomAnchor, constant: 10),
           loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
        
    }
    
    
    @objc func pushView() {
        self.navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    @objc func push2View() {
        self.navigationController?.pushViewController(Login(), animated: true)
    }

}
