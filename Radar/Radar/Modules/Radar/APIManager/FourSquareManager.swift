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
class FourSquareManager {
  let client = Client(clientID: Constans.FourSquareAPI.clientID,
    clientSecret: Constans.FourSquareAPI.clientSecret,
    redirectURL: "testapp123://foursquare")
  
  class var sharedInstance: FourSquareManager {
    struct Singleton {
      static let instance = FourSquareManager()
    }
    return Singleton.instance
  }
  
  private init() {
    let configuration = Configuration(client: client)
    Session.setupSharedSessionWithConfiguration(configuration)
    
  }
  
  func getVenues(location: CLLocation?) {
    var parameters = [Parameter.query: "Burgers"]
    let session = Session.sharedSession()
    parameters += location!.parameters()
    let searchTask = session.venues.search(parameters) {
      (result) -> Void in
      if let response = result.response {
        // self.venues = response["venues"] as [JSONParameters]?
        // self.tableView.reloadData()
      }
    }
    searchTask.start()
  }
  
  // var configuration = Configuration(client: client)
  // Session.setupSharedSessionWithConfiguration(configuration)
  
}

