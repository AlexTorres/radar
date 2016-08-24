//
//  VenueDetail.swift
//  Radar
//
//  Created by iOS Development on 8/23/16.
//  Copyright © 2016 meridian. All rights reserved.
//

import UIKit
import MapKit
import AlamofireImage

class VenueDetail: UIViewController {
  
  @IBOutlet weak var venueImage: UIImageView!
  @IBOutlet weak var mapView: MKMapView!
  static let venueDetailSegue = "VenueDetailSegue"
  
  var venueDetail: VenueDetailItem? {
    didSet {
      
    }
  }
  internal func loadImage() {
    guard venueDetail?.getFotoURL() != nil else {
      return
    }
    guard let url = NSURL(string: venueDetail!.getFotoURL()) else {
      return
    }
    venueImage.af_setImageWithURL(url)
    
  }
  internal func putAnotattion() {
    let pinLocation = CLLocationCoordinate2DMake(venueDetail!.latitude!, venueDetail!.longitude!)
    setRegion(pinLocation)
    let dropPin = MKPointAnnotation()
    dropPin.coordinate = pinLocation
    dropPin.title = venueDetail?.name
    mapView.addAnnotation(dropPin)
    
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    putAnotattion()
    loadImage()
    self.title = venueDetail?.name!
    
    // Do any additional setup after loading the view.
  }
  
  internal func setRegion (center: CLLocationCoordinate2D) {
    let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    self.mapView.setRegion(region, animated: true)
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
