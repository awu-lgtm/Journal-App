//
//  ViewController.swift
//  journal
//
//  Created by Allen Wu on 11/27/22.
//

import UIKit

class ViewController: UIViewController {
    
    let refresh = UIRefreshControl()
    let journalTable = UITableView()
    
    
    let add = UIButton()
    var index: Int = 0
    
    var journals: [Journal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Journals"
        view.backgroundColor = .white
        
        let simon = Journal(id: 2758, title: "Happy", description: "I am feeling happy :)")
        let allen = Journal(id: 4, title: "Sad", description: "I am feeling sad :(")
        let irene = Journal(id: 598, title: "Excited", description: "I am feeling so excited!")
        let jake = Journal(id: 3, title: "Homesick", description: "I am feeling very homesick")
        let noah = Journal(id: 285, title: "Stressed", description: "I feel very stressed and overwhelmed")
        journals = [simon, allen, irene, jake, noah]
        
        if #available(iOS 10.0, *) {
            journalTable.refreshControl = refresh
        } else {
            journalTable.addSubview(refresh)
        }
        
        journalTable.delegate = self
        journalTable.dataSource = self
        journalTable.register(JournalViewCell.self, forCellReuseIdentifier:"journalCell")
    }


}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        present(JournalViewController(delegate: self), animated:true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            journals.remove(at: indexPath.row)
            journalTable.beginUpdates()
            journalTable.deleteRows(at: [indexPath], with: .automatic)
            journalTable.endUpdates()
        }
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let journal = tableView.dequeueReusableCell(withIdentifier: "journalCell", for: indexPath) as! JournalViewCell
        let journalModel = journals[indexPath.row]
        journal.configure(journal: journalModel)
        return journal
    }
}

extension ViewController: ChangeJournalDelegate {
    func getJournal() -> Journal {
        return journals[index]
    }
    func setJournal(journal: Journal) {
        journals[index] = journal
        journalTable.reloadData()
    }
}
