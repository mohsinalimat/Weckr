//
//  TimeIntervall+Extensions.swift
//  Weckr
//
//  Created by Tim Mewe on 12.12.18.
//  Copyright © 2018 Tim Lehmann. All rights reserved.
//

import Foundation

extension TimeInterval {
    func toHoursMinutes() -> (Int, Int) {
        return (Int(self / 3600), Int((self.truncatingRemainder(dividingBy: 3600)) / 60))
    }
}
