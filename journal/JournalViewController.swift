//
//  JournalViewController.swift
//  journal
//
//  Created by Allen Wu on 11/27/22.
//

import UIKit
//import DropDown
import iOSDropDown

class JournalViewController: Entry { // this should extend Entry
    
    weak var delegate: ChangeJournalDelegate?
    
    var journal: Journal
    
    init(delegate: ChangeJournalDelegate) {
        self.delegate = delegate
        journal = delegate.getJournal()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
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
        
    }
    
    @objc
    override func endEdit() {
        super.endEdit()
        delegate?.setJournal(journal: Journal(id: journal.id, title: header.text ?? "Today", content: des.text, emotion: journal.emotion))
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

