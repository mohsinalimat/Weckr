//
//  RoutePedestrianTableViewCell.swift
//  Weckr
//
//  Created by Tim Mewe on 22.12.18.
//  Copyright © 2018 Tim Lehmann. All rights reserved.
//

import Foundation
import UIKit

class RoutePedestrianTableViewCell: TileTableViewCell, BasicInfoSubtitleDisplayable {
    
    typealias Configuration = Maneuver
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        gradient = (UIColor.routeCellLeft.cgColor, UIColor.routeCellRight.cgColor)
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(with configuration: Maneuver) {
        
        // Turn left onto Danziger Straße. Go for 64 m.
        let sentences = configuration.instruction.components(separatedBy: ".")
        let words = sentences.first!.components(separatedBy: " ")
        // Turn left onto Danziger Straße.
        
        let directionText = words.prefix(2).naturalJoined().removeDots()
        // Turn left
        
        let direction = DirectionInstruction(rawValue: directionText)
        
        var destination = ""
        if direction != nil {
            switch direction! {
            case .roundabout:
                destination = words.dropFirst(9).naturalJoined()
            default:
                destination = words.dropFirst(3).naturalJoined()
                // Danziger Straße
            }
        }
        
        let duration = Int(configuration.travelTime/60)
        let durationText = duration > 0 ? "\(duration) MIN" : ""
        
        infoView.headerInfoView.leftLabel.text = direction?.localized.uppercased()
        infoView.headerInfoView.rightLabel.text = durationText
        infoView.infoLabel.text = destination.removeDots()
        distanceLabel.text = "\(Int(configuration.length)) meters"
    }
    
    var infoView: BasicInfoView = {
        let view = BasicInfoView.newAutoLayout()
        return view
    }()
    
    var distanceLabel = SmallLabel.newAutoLayout()
}