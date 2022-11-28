//
//  JournalViewController.swift
//  journal
//
//  Created by Allen Wu on 11/27/22.
//

import UIKit

class JournalViewController: UIViewController {
    
    weak var delegate: ChangeJournalDelegate?
    
    var journal: Journal
    
    let edit = UIButton()
    let header = UILabel()
    let des = UITextView()
    
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

        header.text = journal.title
        des.text = journal.description
        
        header.font = .boldSystemFont(ofSize: 20)
        
        header.translatesAutoresizingMaskIntoConstraints = false
        des.translatesAutoresizingMaskIntoConstraints = false
        
        header.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(70)
            make.left.equalToSuperview().offset(70)
        }
        
        des.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(des).offset(70)
            make.left.equalTo(des)
        }
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

protocol ChangeJournalDelegate: ViewController {
    func getJournal() -> Journal
    func setJournal(journal: Journal)
}
