//
//  FolderCell.swift
//  Sticky-note
//
//  Created by 廖家龙 on 2022/11/13.
//

import UIKit

protocol OptionCellDelegate: AnyObject {
    func getCellPressed(in cell: UITableViewCell)
}

class FolderCell: UITableViewCell {
    
    weak var delegate: OptionCellDelegate?
    var controller : FolderVC? {
        didSet{
            moreButton.addTarget(controller, action: #selector(FolderVC.didTapMoreImage), for: .touchUpInside)
        }
    }
    
    var data: Folder? {
        didSet{
            manageData()
        }
    }
    static let reusableId = "FolderCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: FolderCell.reusableId)
        setupViews()
        setupContraints()
        backgroundColor = .clear
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Propeties -
    let container: UIView = {
        let v = UIView()
        v.backgroundColor = Color.pad_bg
        v.layer.cornerRadius = 20
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 1
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let dateLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: Font.medium.rawValue, size: 14)
        lb.textColor = Color.text_color_normal
        lb.numberOfLines = 0
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    lazy var moreButton : UIButton = {
        let b = UIButton()
        let image = UIImage(systemName: "ellipsis",withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .semibold))
        b.setImage(image, for: .normal)
        b.tintColor = .systemGray2
        b.backgroundColor = .clear
        b.addTarget(self, action: #selector(deletePressed), for: .primaryActionTriggered)
        b.adjustsImageWhenHighlighted = false
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    let categoryContainer: UIView = {
        let v = UIView()
        v.layer.borderWidth = 1
        v.layer.borderColor = Color.text_color_normal.cgColor
        v.layer.cornerRadius = 30/2
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let categoryLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: Font.medium.rawValue, size: 14)
        lb.textColor = Color.text_color_normal
        lb.numberOfLines = 0
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    @objc func deletePressed(){
        delegate?.getCellPressed(in: self)
    }
    
    func setupViews(){
        contentView.addSubview(container)
        container.addSubview(titleLabel)
        container.addSubview(categoryContainer)
        categoryContainer.addSubview(categoryLabel)
        container.addSubview(moreButton)
        container.addSubview(dateLabel)
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: moreButton.leadingAnchor, constant: -10),
            
            moreButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            moreButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            moreButton.heightAnchor.constraint(equalToConstant: 30),
            moreButton.widthAnchor.constraint(equalToConstant: 30),
            
            categoryContainer.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20),
            categoryContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            categoryContainer.heightAnchor.constraint(equalToConstant: 30),
            
            categoryLabel.centerYAnchor.constraint(equalTo: categoryContainer.centerYAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: categoryContainer.leadingAnchor,constant: 15),
            categoryLabel.trailingAnchor.constraint(equalTo: categoryContainer.trailingAnchor,constant: -15),
            
            dateLabel.centerYAnchor.constraint(equalTo: categoryContainer.centerYAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
        ])
    }
    func manageData(){
        guard let item = data else { return }
        guard let heading = item.heading else { return }
        guard let noteCount = item.notes?.count else { return }
        guard let date = item.createdAt else { return }
        guard let category = item.category else { return }
        
        titleLabel.attributedText = setupAttributedText(heading, noteCount)
        dateLabel.text = "\(date.timeAgoDisplay())"

        
        if category.isEmpty {
            categoryContainer.isHidden = true
            categoryContainer.alpha = 0
        } else {
            categoryLabel.text = category
        }
    }
    func setupAttributedText(_ title: String,_ noteCount: Int) -> NSAttributedString{
        let text = NSMutableAttributedString(string: title, attributes: [.foregroundColor: Color.text_color_heading,.font: UIFont(name: Font.semi_bold.rawValue, size: 18)!])
        text.append(NSAttributedString(string: " (\(noteCount))", attributes: [.foregroundColor: Color.text_color_normal,.font: UIFont(name: Font.medium.rawValue, size: 14)!]))
        return text
    }
}

