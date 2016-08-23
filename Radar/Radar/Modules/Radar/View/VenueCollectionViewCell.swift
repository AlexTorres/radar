//
//  VenueCollectionViewCell.swift
//  Radar
//
//  Created by iOS Development on 8/23/16.
//  Copyright © 2016 meridian. All rights reserved.
//

import UIKit

class VenueCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var mayorLabel: UILabel!
  
  static let kVenueReusableName = "VenueCollectionViewCell"
  var venue: VenueItem? {
    didSet {
      nameLabel.text = venue?.name!
      if venue?.mayorSummary != nil {
        mayorLabel.text = venue?.mayorSummary!
      }
      
    }
  }
}
