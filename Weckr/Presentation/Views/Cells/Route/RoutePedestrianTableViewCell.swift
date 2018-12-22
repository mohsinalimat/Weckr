//
//  RoutePedestrianTableViewCell.swift
//  Weckr
//
//  Created by Tim Mewe on 22.12.18.
//  Copyright © 2018 Tim Lehmann. All rights reserved.
//

import Foundation
import UIKit

class RoutePedestrianTableViewCell: TileTableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        gradient = (UIColor.routeCellLeft.cgColor, UIColor.routeCellRight.cgColor)
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(with maneuver: Maneuver) {
        
        let text = maneuver.instruction.replacingOccurrences(of: "<[^>]+>",
                                                             with: "",
                                                             options: .regularExpression,
                                                             range: nil)
        let words = text.components(separatedBy: " ")
        
        let directionText = words.prefix(2).naturalJoined().replacingOccurrences(of: ".", with: "")
        let direction = DirectionInstruction(rawValue: directionText)
        
        let destination = words.dropFirst(3).prefix(1)
        
        let duration = Int(maneuver.travelTime/60)
        let durationText = duration > 0 ? "\(duration) MIN" : ""

        infoView.headerInfo.leftLabel.text = direction?.localized.uppercased()
        infoView.headerInfo.rightLabel.text = durationText
        infoView.infoLabel.text = destination.joined().replacingOccurrences(of: ".", with: "")
        distanceLabel.text = "\(Int(maneuver.length)) meters"
    }
    
    private func addSubviews() {
        tileView.addSubview(infoView)
        tileView.addSubview(distanceLabel)
    }
    
    private func setupConstraints() {
        let insets = Constraints.Main.Text.self
        infoView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: insets.top,
                                                                 left: insets.left,
                                                                 bottom: insets.bottom,
                                                                 right: insets.right),
                                              excludingEdge: .bottom)
        distanceLabel.autoPinEdge(.top, to: .bottom, of: infoView, withOffset: insets.largeSpacing)
        distanceLabel.autoPinEdge(.left, to: .left, of: tileView, withOffset: insets.left)
        distanceLabel.autoPinEdge(.right, to: .right, of: tileView, withOffset: insets.right)
        tileView.autoPinEdge(.bottom, to: .bottom, of: distanceLabel, withOffset: insets.bottom)
    }
    
    let infoView: BasicInfoView = {
        let view = BasicInfoView.newAutoLayout()
        return view
    }()
    
    let distanceLabel = SmallLabel.newAutoLayout()
}
