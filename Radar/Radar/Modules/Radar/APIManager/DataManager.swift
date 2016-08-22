//
//  DataManager.swift
//  Radar
//
//  Created by John Alexandert Torres on 8/19/16.
//  Copyright © 2016 meridian. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class DataManager: NSObject, ResultInputManagerProtocol, CLLocationManagerDelegate {
  weak var presenter: protocol<ResultPresenterProtocol, ResultManagerOutputProtocol>?
  let coreLocationManager = CLLocationManager()
  
  override init() {
    
  }
  func getUserLocation() {
    coreLocationManager.delegate = self
    if CLLocationManager.authorizationStatus() == .NotDetermined {
      coreLocationManager.requestAlwaysAuthorization()
    } else if (CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse) {
      coreLocationManager.startUpdatingLocation()
    }
    coreLocationManager.distanceFilter = 3000 // Must move at least 3km
    coreLocationManager.desiredAccuracy = kCLLocationAccuracyKilometer // Accurate within a kilometer
    
  }
  
  func locationManager(manager: CLLocationManager,
    didChangeAuthorizationStatus status: CLAuthorizationStatus) {
      if status == .AuthorizedWhenInUse || status == .AuthorizedAlways {
        manager.startUpdatingLocation()
      }
  }
  
  func locationManager(manager: CLLocationManager,
    didUpdateToLocation newLocation: CLLocation, fromLocation
    oldLocation: CLLocation) {
      
      let center = CLLocationCoordinate2D(latitude: newLocation.coordinate.latitude, longitude: newLocation.coordinate.longitude)
      let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
      presenter?.updateRegion(region)
      // userLocationObject = newLocation
      // userLocation = newLocation.coordinate
      // manager.stopUpdatingLocation()
      // delegate?.userLocationAutorized()
  }
  
}
