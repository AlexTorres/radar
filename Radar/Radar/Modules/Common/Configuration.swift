//
//  Configuration.swift
//  Radar
//
//  Created by John Alexandert Torres on 8/19/16.
//  Copyright © 2016 meridian. All rights reserved.
//

import Foundation
import UIKit

class Configuration {
  
  class var sharedInstance: Configuration {
    struct Singleton {
      static let instance = Configuration()
    }
    return Singleton.instance
  }
  
  var appWidth: CGFloat {
    get {
      let screenRect = UIScreen.mainScreen().bounds
      let screenWidth = screenRect.size.width
      return screenWidth
    }
  }
  
  var appHeight: CGFloat {
    get {
      let screenRect = UIScreen.mainScreen().bounds
      let screenHeight = screenRect.size.height
      return screenHeight
    }
  }
}

