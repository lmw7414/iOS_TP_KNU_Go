//
//  LocationService.swift
//  knuGo
//
//  Created by lmw on 2022/05/06.
//

import Foundation
import CoreLocation

class LocationService : NSObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    var completionHandler: ((CLLocationCoordinate2D) -> (Void))?
    
    override init() {
        super.init()
        
        manager.delegate = self
        //위치정보 승인 요청
        manager.requestWhenInUseAuthorization()
    }
    
    func requestLocation(completion: @escaping ((CLLocationCoordinate2D) -> (Void))) {
        completionHandler = completion
    }
}
