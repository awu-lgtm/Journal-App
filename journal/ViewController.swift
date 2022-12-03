//
//  ViewController.swift
//  journal
//
//  Created by Allen Wu on 11/27/22.
//

import UIKit
import SnapKit
import Lottie

class ViewController: UIViewController {
    
    var swiftAnimationView: LottieAnimationView!
    let refresh = UIRefreshControl()
    let journalTable = UITableView()
    let favorite = UIButton()
    let add = UIButton()
    
    var index: Int = 0
    
    var journals: [Journal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        add.setImage(UIImage(named: "add"), for: .normal)
        
//        swiftAnimationView = .init(name: "heart")
//        view.addSubview(swiftAnimationView)
        
        
        title = "My Journals"
        view.backgroundColor = .white
        
//        let simon = Journal(id: 2758, title: "Happy", description: "I am feeling happy :)", mood: "happy")
//        let allen = Journal(id: 4, title: "Sad", description: "I am feeling sad :(", mood: "sad")
//        let irene = Journal(id: 598, title: "Excited", description: "I am feeling so excited!", mood: "excited")
//        let jake = Journal(id: 3, title: "Homesick", description: "I am feeling very homesick", mood: "homesick")
//        let noah = Journal(id: 285, title: "Stressed", description: "I feel very stressed and overwhelmed", mood: "stressed")
//        journals = [simon, allen, irene, jake, noah]
        
        getJournals()
        
        if #available(iOS 10.0, *) {
            journalTable.refreshControl = refresh
        } else {
            journalTable.addSubview(refresh)
        }
        
        refresh.addTarget(self, action: #selector(refreshJournals), for: .valueChanged)
        
        journalTable.delegate = self
        journalTable.dataSource = self
        journalTable.register(JournalViewCell.self, forCellReuseIdentifier:"journalCell")
        
        journalTable.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(journalTable)
        
        journalTable.snp.makeConstraints { (make) -> Void in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(120)
        }
    }
    
    func getJournals() {
        NetworkManager.getAll { journals in
            self.journals = journals.journals
            
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
        present(JournalViewController(delegate: self), animated:true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            journals.remove(at: indexPath.row)
            journalTable.beginUpdates()
            deleteJournal(id: journals[indexPath.row].id)
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
