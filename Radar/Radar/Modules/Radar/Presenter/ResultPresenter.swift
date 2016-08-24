//
//  ResultPresenter.swift
//  Radar
//
//  Created by John Alexandert Torres on 8/19/16.
//  Copyright © 2016 meridian. All rights reserved.
//

import Foundation
import MapKit
class ResultPresenter: ResultPresenterProtocol, ResultManagerOutputProtocol {
  weak var view: ResultViewProtocol?
  var manager: ResultInputManagerProtocol?
  
  init() {
  }
  func startUsingLocation() {
    manager?.getUserLocation()
  }
  func entiesLoaded() {
    view?.viewCanInit()
  }
  func searchProductsWithString(searchString: String) {
    // manager?.searchEntriesWithString(searchString)
  }
  func rowsFromManager(sections: [String]?, rows: [[String]]?) {
    // view?.reloadEntries(sections, rows: rows)
  }
  func updateRegion(region: MKCoordinateRegion?) {
    view?.reloadMapWithRegion(region)
  }
  func upatedVenuesArray(venues: [VenueItem]?) {
    view?.reloadVenuesArray(venues)
  }
  func updatedVenue(venue: VenueDetailItem?) {
    view?.callVenueItem(venue)
  }
  func searchVenueWithID(venueID: String?) {
    manager?.getVenueWithID(venueID)
  }
  
}
