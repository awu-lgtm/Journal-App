//
//  JournalViewCell.swift
//
//
//  Created by Allen Wu on 11/27/22.
//

import UIKit
import SnapKit
import Lottie

class JournalViewCell: UITableViewCell {
    var id = UILabel()
    var title = UILabel()
    var des = UILabel()
//    let favorite = UIButton()
//    var favorited = false
//    var swiftAnimationView: LottieAnimationView!

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
            make.centerY.equalTo(contentView)
            make.left.equalTo(title)
        }
        
//        swiftAnimationView = .init(name: "heart")
//        contentView.addSubview(swiftAnimationView)
//        
//        swiftAnimationView.snp.makeConstraints { (make) -> Void in
//            make.width.equalToSuperview().multipliedBy(0.5)
//            make.height.equalTo(contentView.snp.width)
//            make.trailing.equalToSuperview().offset(50)
//            make.centerY.equalToSuperview()
//        }
//        
//        favorite.translatesAutoresizingMaskIntoConstraints = false
//        favorite.addTarget(self, action: #selector(addFavorite), for: .touchUpInside)
//        contentView.addSubview(favorite)
//        
////        favorite.backgroundColor = .black
//        favorite.snp.makeConstraints { (make) -> Void in
//            make.width.equalToSuperview().multipliedBy(0.1)
//            make.height.equalToSuperview().multipliedBy(0.2)
//            make.trailing.equalToSuperview().offset(-30)
//            make.centerY.equalToSuperview()
    }
    
//    @objc
//    func addFavorite() {
//        if (favorited) {
//            swiftAnimationView.play(fromFrame:141, toFrame: 150)
//        }
//        else {
//            swiftAnimationView.play(fromFrame:58, toFrame: 108)
//        }
//        favorited.toggle()
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
    }

    
    func configure(journal: Journal) {
        des.text = journal.content
        title.text = journal.title
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
