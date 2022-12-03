//
//  Overlay.swift
//  journal
//
//  Created by Allen Wu on 12/1/22.
//

import UIKit

class Overlay: UIViewController {
    var button: UIButton!
    
    let add = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.992, green: 0.988, blue: 0.863, alpha: 1)
        setUpAddButton()

        // Do any additional setup after loading the view.
    }
    
    func setUpAddButton() {
        add.setImage(UIImage(named: "add"), for: .normal)
        add.addTarget(self, action: #selector(newEntry), for: .touchUpInside)
        
        add.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(add)
        
        add.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(5)
            make.trailing.equalToSuperview().offset(-50)
        }
    }
        
    @objc
    func newEntry() {
        navigationController?.setViewControllers([Feeling()], animated: true)
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
