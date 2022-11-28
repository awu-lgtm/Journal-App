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
        
        contentView.backgroundColor = .white

        contentView.clipsToBounds = true
        
//        des.textColor = .white
//        title.textColor = .white
        
        des.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(id)
        contentView.addSubview(des)
        contentView.addSubview(title)
        
        title.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView).offset(15)
            make.left.equalTo(contentView).offset(15)
        }
        
        des.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(title)
            make.left.equalTo(title)
        }

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
    }

    
    func configure(journal: Journal) {
        des.text = journal.description
        title.text = journal.title
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
