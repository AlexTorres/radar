//
//  CLLocaation+Utils.swift
//  Radar
//
//  Created by John Alexandert Torres on 8/21/16.
//  Copyright © 2016 meridian. All rights reserved.
//

import Foundation
import CoreLocation
import QuadratTouch
extension CLLocation {
  func parameters() -> Parameters {
    let ll = "\(self.coordinate.latitude),\(self.coordinate.longitude)"
    let llAcc = "\(self.horizontalAccuracy)"
    let alt = "\(self.altitude)"
    let altAcc = "\(self.verticalAccuracy)"
    let parameters = [
      Parameter.ll: ll,
      Parameter.llAcc: llAcc,
      Parameter.alt: alt,
      Parameter.altAcc: altAcc
    ]
    return parameters
  }
}