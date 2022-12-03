//
//  Entry.swift
//  journal
//
//  Created by Allen Wu on 12/1/22.
//

import UIKit

class Entry: Overlay {
    
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
    
    let titleMood = UILabel()
    
    let placeholder = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBorder()
        setUpText()
        setUpEdit()
        setUpTitle()
    }
    
    func setUpTitle() {
        titleMood.font = UIFont(name: "Verdana", size: 25)
        titleMood.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleMood)
        
        titleMood.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(add)
        }
    }
    
    func setUpBorder() {
        border.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(border)
        
        border.snp.makeConstraints { (make) -> Void in
            make.centerX.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
    }
    
    func setUpText() {
        header.text = "i'm feeling \(titleMood.text ?? "...")"
        
        des.delegate = self
        
        header.font = UIFont(name: "Verdana", size: 25)
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10
        des.typingAttributes = [NSAttributedString.Key.font: UIFont(name: "Verdana", size: 18)!, NSAttributedString.Key.paragraphStyle: style]
        
        placeholder.text = "Enter some text..."
        placeholder.font = UIFont(name: "Verdana", size: 18)
        placeholder.sizeToFit()
        des.addSubview(placeholder)
        placeholder.frame.origin = CGPoint(x: 5, y: ((des.font?.pointSize) ?? 18) / 2)
        placeholder.textColor = .lightGray
        placeholder.isHidden = !des.text.isEmpty
        
        header.translatesAutoresizingMaskIntoConstraints = false
        des.translatesAutoresizingMaskIntoConstraints = false
        
        des.backgroundColor = .clear
        
        view.addSubview(header)
        view.addSubview(des)
        
        header.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(border).offset(30)
            make.leading.equalTo(border).offset(30)
        }
        
        des.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(header).offset(50)
            make.leading.equalTo(header).offset(-5)
            make.trailing.equalTo(border).offset(-30)
            make.height.equalTo(border).multipliedBy(0.75)
        }
    }
    
    func setUpEdit() {
        edit.setBackgroundImage(UIImage(named: "Edit box"), for: .normal)
        edit.setTitleColor(.black, for: .normal)
        edit.titleLabel?.font = UIFont(name: "Verdana", size: 18)
        
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
        view.addSubview(edit)
        
        edit.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(border.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalToSuperview().multipliedBy(0.05)
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

extension Entry: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        placeholder.isHidden = !des.text.isEmpty
    }
}

//protocol EntryDelegate: ViewController {
//    var mood: String { get }
//}
