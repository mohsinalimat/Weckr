//
//  AlarmServiceError.swift
//  Weckr
//
//  Created by Tim Mewe on 28.11.18.
//  Copyright © 2018 Tim Lehmann. All rights reserved.
//

import Foundation

enum AlarmServiceError: AppError {
    case creationFailed
    case deletionFailed(Alarm)
    
    var localizedMessage: String {
        return "yeaf"
    }
}
