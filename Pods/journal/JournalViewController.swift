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

        // Do any additional setup after loading the view.
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
