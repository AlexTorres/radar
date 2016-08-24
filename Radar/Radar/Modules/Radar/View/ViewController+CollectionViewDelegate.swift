//
//  ViewController+CollectionViewDelegate.swift
//  Radar
//
//  Created by John Alexandert Torres on 8/19/16.
//  Copyright © 2016 meridian. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  // MARK: UICollectionViewDataSource
  
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of items
    guard venues != nil else {
      return 0
    }
    return venues!.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(VenueCollectionViewCell.kVenueReusableName, forIndexPath: indexPath) as? VenueCollectionViewCell
    
    // Configure the cell
    cell?.venue = self.venues?[indexPath.row]
    
    return cell!
  }
  
  func collectionView(collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath
    indexPath: NSIndexPath) -> CGSize {
      let cellWidth = (AppConfiguration.sharedInstance.appWidth - 30) / 3
      let size = CGSizeMake(cellWidth, cellWidth + 50)
      
      return size
  }
  
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    let venue = venues?[indexPath.row]
    presenter?.searchVenueWithID(venue?.id)
  }
 
}
