//
//  Configuration.swift
//  Radar
//
//  Created by John Alexandert Torres on 8/19/16.
//  Copyright © 2016 meridian. All rights reserved.
//

import Foundation
import UIKit

class AppConfiguration {
  
  class var sharedInstance: AppConfiguration {
    struct Singleton {
      static let instance = AppConfiguration()
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

