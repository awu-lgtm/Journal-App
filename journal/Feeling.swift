//
//  Feeling.swift
//  journal
//
//  Created by Allen Wu on 12/1/22.
//

import UIKit

class Feeling: Overlay {
    
    let border = UIImageView(image: UIImage(named: "Border"))
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
        
        setUpBorder()
        setUpHeader()
        setUpFeelings()

        // Do any additional setup after loading the view.
    }
    
    func setUpHeader() {
        header.text = "i'm feeling..."
        header.font = UIFont(name: "Verdana", size: 25)
        
        header.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(header)
        
        header.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(border).offset(30)
            make.top.equalTo(border).offset(30)
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
    
    func setUpFeelings() {
        let buttons: [MoodButton] = [b1, b2, b3, b4]
        let feelingLabels: [UILabel] = [f1, f2, f3, f4]
        let feelings: [String] = ["happy", "grateful", "excited", "other"]
        
        for i in 0...3 {
            let b = buttons[i]
            let f = feelingLabels[i]
            
            b.mood = feelings[i]
            b.setImage(box, for: .normal)
            if b.mood != "other" {
                b.addTarget(self, action: #selector(self.createEntry), for: .touchUpInside)
            }
            
            f.text = feelings[i]
            f.font = UIFont(name: "Verdana", size: 17)
            
            b.translatesAutoresizingMaskIntoConstraints = false
            f.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(b)
            view.addSubview(f)
        }
        
        b4.addTarget(self, action: #selector(swapFeelings), for: .touchUpInside)
        
        let xOffset = 80
        let yOffset = 60
        
        b1.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(border).offset(-xOffset)
            make.centerY.equalTo(border).offset(-yOffset)
            make.width.equalTo(border).multipliedBy(0.4)
//            make.height.equalTo(border.snp.width).multipliedBy(2)
            make.height.equalTo(border).multipliedBy(0.5)
        }
        
        f1.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(b1)
            make.centerY.equalTo(b1)
        }

        b2.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(border).offset(xOffset)
            make.centerY.equalTo(b1)
            make.width.equalTo(b1)
            make.height.equalTo(b2)
        }

        f2.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(b2)
            make.centerY.equalTo(b2)
        }

        b3.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(b1)
            make.centerY.equalTo(border).offset(yOffset + 50)
            make.width.equalTo(b1)
            make.height.equalTo(b1)
        }

        f3.snp.makeConstraints { (make) -> Void in
            make.centerX.centerY.equalTo(b3)
        }

        b4.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(b2)
            make.centerY.equalTo(b3)
            make.width.equalTo(b1)
            make.height.equalTo(b1)
        }

        f4.snp.makeConstraints { (make) -> Void in
            make.centerX.centerY.equalTo(b4)
        }
    }
    
    @objc
    func createEntry(sender: MoodButton) {
        self.navigationController?.pushViewController(NewEntry(mood: sender.mood), animated: true)
    }
    
    @objc
    func swapFeelings() {
        if (option1) {
            setFeelings(false)
            option1 = false
            return
        }
        setFeelings(true)
        option1 = true
    }
    
    func setFeelings(_ option1: Bool) {
        let feelings: [String]
        let feelingLabels: [UILabel] = [f1, f2, f3, f4]
        let buttons: [MoodButton] = [b1, b2, b3, b4]
        
        if (option1) {
            feelings = ["happy", "grateful", "excited", "other"]
        } else {
            feelings = ["sad", "anxious", "stressed", "other"]
        }
        
        for i in 0...3 {
            buttons[i].mood = feelings[i]
            feelingLabels[i].text = feelings[i]
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
