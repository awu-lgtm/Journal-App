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
    }

}
