//
//  FourSquareManager.swift
//  Radar
//
//  Created by John Alexandert Torres on 8/19/16.
//  Copyright © 2016 meridian. All rights reserved.
//

import Foundation
import QuadratTouch
import CoreLocation
typealias JSONParameters = [String: AnyObject]
class FourSquareManager: FourSquareAPI {
  let client = Client(clientID: Constans.FourSquareAPI.clientID,
    clientSecret: Constans.FourSquareAPI.clientSecret,
    redirectURL: "testapp123://foursquare")
  
  class var sharedInstance: FourSquareManager {
    struct Singleton {
      static let instance = FourSquareManager()
    }
    return Singleton.instance
  }
  var dataManager: ResultInputManagerProtocol?
  private init() {
    let configuration = Configuration(client: client)
    Session.setupSharedSessionWithConfiguration(configuration)
  }
  
  func getVenuesFromFourSquareAPI(location: CLLocation?) {
    var parameters = [Parameter.query: ""]
    let session = Session.sharedSession()
    parameters += location!.parameters()
    var venuesArray = [VenueItem]()
    let searchTask = session.venues.search(parameters) {
      guard let response = $0.response else {
        return
      }
      let venuesJsonArray = response["venues"] as! [JSONParameters]?
      
      for (_, value) in venuesJsonArray!.enumerate() {
        let venueObject = VenueItem(JSON: value)
        venuesArray.append(venueObject!)
      }
      self.dataManager?.upatedVenuesArrayFromAPI(venuesArray)
    }
    searchTask.start()
  }
  
  func getVenueFromFourSquareAPI(venueID: String?) {
    
    let session = Session.sharedSession()
        let searchTask = session.venues.get(venueID!) {
      guard let response = $0.response else {
        return
      }
      print(response["venue"])
    }
    searchTask.start()
  }
}
