//
//  RadarProtocols.swift
//  Radar
//
//  Created by John Alexandert Torres on 8/19/16.
//  Copyright © 2016 meridian. All rights reserved.
//

import Foundation
import MapKit

protocol ResultViewProtocol: class {
  var presenter: ResultPresenterProtocol? { get set }
  var venues: [VenueItem]? { get set }
  func viewCanInit()
  func reloadMapWithRegion(region: MKCoordinateRegion?)
  func reloadVenuesArray(venues: [VenueItem]?)
  // func reloadEntries(sections: [String]?, rows: [[String]]?)
}
protocol ResultPresenterProtocol: class {
  var view: ResultViewProtocol? { get set }
  var manager: ResultInputManagerProtocol? { get set }
  
  func startUsingLocation()
  func searchVenueWithID(venueID: String?)
}
protocol ResultInputManagerProtocol: class {
  var presenter: protocol<ResultPresenterProtocol, ResultManagerOutputProtocol>? { get set }
  var fourSquareAPI: FourSquareAPI? { get set }
  
  func upatedVenuesArrayFromAPI(venues: [VenueItem]?)
  func getUserLocation()
  func getVenueWithID(venueID: String?)
}
protocol FourSquareAPI: class {
  var dataManager: ResultInputManagerProtocol? { get set }
  
  func getVenuesFromFourSquareAPI(location: CLLocation?)
    func getVenueFromFourSquareAPI(venueID: String?)
}
protocol ResultManagerOutputProtocol: class {
  func entiesLoaded()
  func rowsFromManager(sections: [String]?, rows: [[String]]?)
  func updateRegion(region: MKCoordinateRegion?)
  func upatedVenuesArray(venues: [VenueItem]?)
}
