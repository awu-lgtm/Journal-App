//
//  JournalViewController.swift
//  journal
//
//  Created by Allen Wu on 11/27/22.
//

import UIKit
//import DropDown
import iOSDropDown

class JournalViewController: UIViewController { // this should extend Entry
    
    weak var delegate: ChangeJournalDelegate?
    
    var journal: Journal
    
//    @IBOutlet var dropDown : DropDown!
    let dropDown = DropDown()
    let edit = UIButton()
    let done = UIButton()
    let header = UITextField()
    let des = UITextView()
    let mood: String
    
    init(delegate: ChangeJournalDelegate) {
        self.delegate = delegate
        journal = delegate.getJournal()
        mood = "happy"
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My entry"
        view.backgroundColor = .white

        header.text = journal.title
        des.text = journal.description
        
        disableEdits()
        
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
        
        edit.addTarget(self, action: #selector(startEdit), for: .touchUpInside)
        done.addTarget(self, action: #selector(endEdit), for: .touchUpInside)
        
        edit.translatesAutoresizingMaskIntoConstraints = false
        edit.backgroundColor = .red
        done.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(edit)
        view.addSubview(done)
        
        edit.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(header).offset(50)
            make.right.equalToSuperview().offset(-50)
            make.width.equalToSuperview().multipliedBy(0.1)
            make.height.equalToSuperview().multipliedBy(0.02)
        }
        
        
        
//        dropDown.anchorView = edit// UIView or UIBarButtonItem
//
//        dropDown.dataSource = ["Car", "Motorcycle", "Truck"]
//
//        dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
//           let cell = cell as? MoodCell
//
//           // Setup your custom UI components
//            //cell.configure(mood: item, color: UIColor(red: 1, green: 0.2, blue: 0.2, alpha: 1))
//        }
//
//        dropDown.show()
//
//        dropDown.translatesAutoresizingMaskIntoConstraints = false
//
//        view.addSubview(dropDown)
//
//        dropDown.snp.makeConstraints { (make) -> Void in
//            make.top.equalTo(header).offset(50)
//            make.right.equalToSuperview().offset(-50)
//        }

//        dropDown.translatesAutoresizingMaskIntoConstraints = false
//
//        view.addSubview(dropDown)
        
//        dropDown.isSearchEnable = true

        dropDown.optionArray = ["Sad", "Excited", "Anxious", "Homesick", "Lonely", "Stressed"]
        dropDown.textColor = .blue
        dropDown.rowBackgroundColor = .black
        
        dropDown.showList()
        
        dropDown.didSelect{(selectedText , index ,id) in
        self.header.text = "Selected String: \(selectedText) \n index: \(index)"
        }
        
        
        dropDown.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dropDown)
        
        dropDown.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(header).offset(100)
            make.right.equalToSuperview().offset(-50)
            make.width.equalToSuperview().multipliedBy(0.5)
//            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
    }
    
    @objc
    func startEdit() {
        allowEdits()
    }
    
    @objc
    func endEdit() {
        disableEdits()
        delegate?.setJournal(journal: Journal(id: journal.id, title: header.text ?? "Today", description: des.text, mood: mood))
    }
    
    func allowEdits() {
        header.isUserInteractionEnabled = true
        des.isEditable = true
    }
    
    func disableEdits() {
        header.isUserInteractionEnabled = false
        des.isEditable = false
    }
}

protocol ChangeJournalDelegate: ViewController {
    func getJournal() -> Journal
    func setJournal(journal: Journal)
}

//class MoodCell: DropDownCell {
////    let label = UILabel()
////
////    func configure(mood: String, color: UIColor) {
////        label.text = mood
////        label.textColor = color
////
////        label.translatesAutoresizingMaskIntoConstraints = false
////
////        contentView.addSubview(label)
////    }

