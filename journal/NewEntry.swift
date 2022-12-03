//
//  NewEntry.swift
//  journal
//
//  Created by Allen Wu on 12/2/22.
//

import UIKit

class NewEntry: Entry {
    
    init(mood: String) {
        super.init(nibName: nil, bundle: nil)
        
        titleMood.text = mood
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @objc
    override func endEdit() { // this may be illegal
        super.endEdit()
        NetworkManager.create(title: )
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
