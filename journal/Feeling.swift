//
//  Feeling.swift
//  journal
//
//  Created by Allen Wu on 12/1/22.
//

import UIKit

class Feeling: UIViewController {
    
    let border = UIImage(named: "Border")
    let header = UILabel()
    
    var option1 = true
    
    let box = UIImage(named: "Feeling Box")
    let b1 = MoodButton()
    let f1 = UILabel()
    let b2 = MoodButton()
    let f2 = UILabel()
    let b3 = MoodButton()
    let f3 = UILabel()
    let b4 = MoodButton()
    let f4 = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpHeader()
        setUpFeelings()

        // Do any additional setup after loading the view.
    }
    
    func setUpHeader() {
        header.text = "i'm feeling..."
        header.font = UIFont(name: "Verdana", size: 15)
    }
    
    func setUpBorder() {
    }
    
    func setUpFeelings() {
        let buttons: [MoodButton] = [b1, b2, b3, b4]
        let feelingLabels: [UILabel] = [f1, f2, f3, f4]
        let feelings: [String] = ["happy", "grateful", "excited", "other"]
        
        buttons.forEach { b in b.setImage(box, for: .normal)}
        
        for i in 0...5 {
            buttons[i].mood = feelings[i]
            feelingLabels[i].text = feelings[i]
        }
        
        buttons.forEach {b in
                if b.mood != "other" {
                    b.addTarget(self, action: #selector(self.newEntry), for: .touchUpInside)
                }
        }
        
        b4.addTarget(self, action: #selector(newEntry), for: .touchUpInside)
    }
    
    @objc
    func newEntry(sender: MoodButton) {
//        sender.mood
    }
    
    @objc
    func swapFeelings() {
        if (option1) {
            setFeelings(true)
            option1 = false
            return
        }
        setFeelings(false)
    }
    
    func setFeelings(_ option1: Bool) {
        let feelings: [String]
        
        let buttons: [MoodButton] = [b1, b2, b3, b4]
        if (option1) {
            feelings = ["happy", "grateful", "excited", "other"]
        } else {
            feelings = ["sad", "anxious", "stressed", "other"]
        }
        
        for i in 0...5 {
            buttons[i].mood = feelings[i]
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

class MoodButton: UIButton {
    var mood: String = ""
}
