//
//  Entry.swift
//  journal
//
//  Created by Allen Wu on 12/1/22.
//

import UIKit

class Entry: UIViewController {
    
//    let mood: String
//
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    var creation = true
    
    let border = UIImageView(image: UIImage(named: "Border"))
    let edit = UIButton()
    
    let header = UITextField()
    let date = UILabel()
    let des = UITextView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBorder()
        setUpText()
        setUpEdit()
    }
    
    func setUpBorder() {
        border.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpText() {
        header.font = .boldSystemFont(ofSize: 20)
        des.font = .systemFont(ofSize: 15)
        
        header.translatesAutoresizingMaskIntoConstraints = false
        des.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(header)
        view.addSubview(des)
        
        header.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(70)
            make.left.equalToSuperview().offset(70)
        }
        
        des.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(header).offset(50)
            make.left.equalTo(header)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.7)
        }
    }
    
    func setUpEdit() {
        if (creation) {
            allowEdits()
            edit.setTitle("save", for: .normal)
            edit.addTarget(self, action: #selector(endEdit), for: .touchUpInside)
        } else {
            disableEdits()
            edit.setTitle("edit", for: .normal)
            edit.addTarget(self, action: #selector(startEdit), for: .touchUpInside)
        }
        
        edit.translatesAutoresizingMaskIntoConstraints = false
        edit.backgroundColor = .red
        
        view.addSubview(edit)
        
        edit.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(header).offset(50)
            make.right.equalToSuperview().offset(-50)
            make.width.equalToSuperview().multipliedBy(0.1)
            make.height.equalToSuperview().multipliedBy(0.02)
        }
    }
    
    @objc
    func startEdit() {
        allowEdits()
        edit.setTitle("save", for: .normal)
        edit.addTarget(self, action: #selector(endEdit), for: .touchUpInside)
    }
    
    @objc
    func endEdit() {
        disableEdits()
        edit.setTitle("edit", for: .normal)
        edit.addTarget(self, action: #selector(startEdit), for: .touchUpInside)
    }
    
    func allowEdits() {
        header.isUserInteractionEnabled = true
        des.isEditable = true
    }
    
    func disableEdits() {
        header.isUserInteractionEnabled = false
        des.isEditable = false
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

//protocol EntryDelegate: ViewController {
//    var mood: String { get }
//}
