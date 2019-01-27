//
//  AlarmServiceType.swift
//  Weckr
//
//  Created by Tim Mewe on 28.11.18.
//  Copyright © 2018 Tim Lehmann. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift
import CoreLocation

public typealias LocationCheckResult = (Bool, GeoCoordinate)

protocol RealmServiceType {
    @discardableResult
    func save(alarm: Alarm) -> Observable<Alarm>
    
    @discardableResult
    func update(alarm: Alarm) -> Observable<Alarm>
    
    @discardableResult
    func update(location: GeoCoordinate, for entry: CalendarEntry) -> Observable<CalendarEntry>
    
    @discardableResult
    func update(location: GeoCoordinate, for alarm: Alarm) -> Observable<Alarm>
    
    @discardableResult
    func update(selectedEvent: CalendarEntry, for alarm: Alarm) -> Observable<Alarm>
    
    @discardableResult
    func update(morningRoutine time: TimeInterval, for alarm: Alarm) -> Observable<Alarm>
    
    @discardableResult
    func update(_ route: Route, for alarm: Alarm) -> Observable<Alarm>
    
    @discardableResult
    func update(_ events: [CalendarEntry], for alarm: Alarm) -> Observable<Alarm>
    
    @discardableResult
    func delete(alarm: Alarm, alarmScheduler: AlarmSchedulerServiceType) -> Observable<Void>
    
    @discardableResult
    func deletePastAlarms() -> Observable<Void>

    @discardableResult
    func currentAlarmObservable() -> Observable<Alarm?>
    
    @discardableResult
    func currentAlarm() -> Alarm?
    
    func checkExisting(location: GeoCoordinate) -> Observable<LocationCheckResult>
    
    @discardableResult
    func createFirstAlarm(startLocation: GeoCoordinate,
                          serviceFactory: ServiceFactoryProtocol) -> Observable<AlarmCreationResult<Alarm>>
    
    @discardableResult
    func createAlarmPrior(to date: Date,
                          startLocation: GeoCoordinate,
                          serviceFactory: ServiceFactoryProtocol) -> Observable<AlarmCreationResult<Alarm>>
}
