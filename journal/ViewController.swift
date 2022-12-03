//
//  ViewController.swift
//  journal
//
//  Created by Allen Wu on 11/27/22.
//

import UIKit
import SnapKit
import Lottie

class ViewController: Overlay {
    
    var swiftAnimationView: LottieAnimationView!
    let refresh = UIRefreshControl()
    let journalTable = UITableView()
    let favorite = UIButton()
    
    var index: Int = 0
    
    var journals: [Journal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        title = "My Journals"
        
        let simon = Journal(id: 2758, title: "Happy", content: "I am feeling happy :)", emotion: "happy")
        let allen = Journal(id: 4, title: "Sad", content: "I am feeling sad :(", emotion: "sad")
        let irene = Journal(id: 598, title: "Excited", content: "I am feeling so excited!", emotion: "excited")
        let jake = Journal(id: 3, title: "Homesick", content: "I am feeling very homesick", emotion: "homesick")
        let noah = Journal(id: 285, title: "Stressed", content: "I feel very stressed and overwhelmed", emotion: "stressed")
        journals = [simon, allen, irene, jake, noah]

        getJournals()
        
        if #available(iOS 10.0, *) {
            journalTable.refreshControl = refresh
        } else {
            journalTable.addSubview(refresh)
        }
        
        refresh.addTarget(self, action: #selector(refreshJournals), for: .valueChanged)
        
        journalTable.backgroundColor = .clear
        journalTable.backgroundView = nil
        journalTable.layer.borderColor = .none
        journalTable.layer.borderWidth = 0
        
        journalTable.delegate = self
        journalTable.dataSource = self
        journalTable.register(JournalViewCell.self, forCellReuseIdentifier:"journalCell")
        
        journalTable.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(journalTable)
        
        journalTable.snp.makeConstraints { (make) -> Void in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview()
            make.top.equalTo(add).offset(70)
        }
    }
    
    func getJournals() {
        NetworkManager.getAll { journals in
            self.journals = journals.entries
            
            DispatchQueue.main.async {
                self.journalTable.reloadData()
            }
        }
    }
    
    @objc
    func refreshJournals() {
        getJournals()
        self.refresh.endRefreshing()
    }
    
    @objc
    func deleteJournal(id: Int) {
        NetworkManager.delete(id: String(id)) { journal in
            return
        }
    }

}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height * 0.15
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        navigationController?.pushViewController(JournalViewController(delegate: self), animated:true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteJournal(id: journals[indexPath.row].id)
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
        journal.backgroundView = nil
        journal.backgroundColor = .clear
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
