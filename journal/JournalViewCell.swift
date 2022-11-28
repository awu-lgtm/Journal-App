//
//  JournalViewCell.swift
//
//
//  Created by Allen Wu on 11/27/22.
//

import UIKit
import SnapKit

class JournalViewCell: UITableViewCell {
    var id = UILabel()
    var title = UILabel()
    var des = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .black

        contentView.clipsToBounds = true
        
        id.textColor = .white
        des.textColor = .white
        title.textColor = .white
        
        id.translatesAutoresizingMaskIntoConstraints = false
        des.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(id)
        contentView.addSubview(des)
        contentView.addSubview(title)
        
        id.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(contentView).offset(-15)
            make.left.equalTo(contentView).offset(20)
        }
        des.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(contentView).multipliedBy(0.3)
            make.centerY.equalTo(contentView)
            make.left.equalTo(id)
        }
        title.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView).offset(15)
            make.left.equalTo(id)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
    }

    
    func configure(journal: Journal) {
//        id.text = "ID: \(String(ticket.id))"
//        des.text = ticket.description
//        var not = ""
//        if !ticket.done {
//            not = " not"
//        }
//        done.text = "Status:\(not) done"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
