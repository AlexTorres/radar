//
//  VenueItem.swift
//  Radar
//
//  Created by John Alexandert Torres on 8/22/16.
//  Copyright © 2016 meridian. All rights reserved.
//

import Foundation
import ObjectMapper

struct VenueItem: Mappable {
  var latitude: Double?
  var longitude: Double?
  var id: String?
  var name: String?
  
  init?(_ map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    latitude <- map["location.lat"]
    longitude <- map["location.lng"]
    id <- map["id"]
    name <- map["name"]
  }
}

