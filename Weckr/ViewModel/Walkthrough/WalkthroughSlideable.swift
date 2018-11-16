//
//  WalkthroughSlideWrapper.swift
//  Weckr
//
//  Created by Tim Lehmann on 10.11.18.
//  Copyright © 2018 Tim Lehmann. All rights reserved.
//

import Foundation
import UIKit.UIView
import UIKit.UIColor
import RxSwift
import Action

protocol WalkthroughSlideableOutputsType {
    var accentColor: Observable<CGColor> { get }
    var buttonText: Observable<String> { get }
    var topLabelText: Observable<String> { get }
    var topLabelColoredText: Observable<String> { get }
    var bottomLabelText: Observable<String> { get }
    var bottomLabelColoredText: Observable<String> { get }
}

protocol WalkthroughSlideableActionsType {
    var onNextAction: CocoaAction? { get }
}

protocol WalkthroughSlideableType {
    var outputs: WalkthroughSlideableOutputsType { get }
    var actions: WalkthroughSlideableActionsType { get }
}
