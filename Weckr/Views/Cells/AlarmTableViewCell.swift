//
//  AlarmTableViewCell.swift
//  Weckr
//
//  Created by Tim Mewe on 05.12.18.
//  Copyright © 2018 Tim Lehmann. All rights reserved.
//

import UIKit
import SwiftDate

class AlarmTableViewCell: UITableViewCell, Reusable {
    
    let dateLabel: UILabel = {
       let label = UILabel.newAutoLayout()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 48, weight: .semibold)
        return label
    }()
    
    let arrow: UIImageView = {
        let iv = UIImageView.newAutoLayout()
        iv.image = UIImage(named: "arrow_down")
        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        setupConstraints()
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(with date:Date) {
        let regionalDate = DateInRegion(date, region: Region.current)
        dateLabel.text = regionalDate.toFormat("HH:mm")
    }
    
    private func addSubviews() {
        contentView.addSubview(dateLabel)
        contentView.addSubview(arrow)
    }
    
    private func setupConstraints() {
        let insets = Constraints.Main.Alarm.self
        dateLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: insets.top,
                                                                  left: 0,
                                                                  bottom: 0,
                                                                  right: 0),
                                               excludingEdge: .bottom)
        
        arrow.autoAlignAxis(.vertical, toSameAxisOf: contentView)
        arrow.autoPinEdge(.top, to: .bottom, of: dateLabel,
                          withOffset: Constraints.Main.Alarm.spacing)
        arrow.autoPinEdge(.bottom, to: .bottom, of: contentView,
                          withOffset: -insets.bottom)
    }

}
