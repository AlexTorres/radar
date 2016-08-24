//
//  VenueDetailItem.swift
//  Radar
//
//  Created by John Alexandert Torres on 8/23/16.
//  Copyright © 2016 meridian. All rights reserved.
//

import Foundation
import ObjectMapper

struct VenueDetailItem: Mappable {
  var latitude: Double?
  var longitude: Double?
  var bestPhotoPrefix: String?
  var bestPhotoSuffix: String?
  var name: String?
  
  init?(_ map: Map) {
  }
  
  mutating func mapping(map: Map) {
    latitude <- map["location.lat"]
    longitude <- map["location.lng"]
    bestPhotoPrefix <- map["bestPhoto.prefix"]
    bestPhotoSuffix <- map["bestPhoto.suffix"]
    name <- map["name"]
  }
  
  func getFotoURL() -> String {
    guard bestPhotoPrefix != nil else {
      return ""
    }
    return "\(bestPhotoPrefix!)300x200\(bestPhotoSuffix!)"
  }
  
}

