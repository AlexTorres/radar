//
//  ViewController.swift
//  Radar
//
//  Created by John Alexandert Torres on 8/19/16.
//  Copyright © 2016 meridian. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, ResultViewProtocol {
  var presenter: ResultPresenterProtocol?
  var wireframe: ResultWireFrame?
  var venues: [VenueItem]?
  
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    addViewConnections()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  private func configureView() {
    setNeedsStatusBarAppearanceUpdate()
    navigationController?.navigationBar.barStyle = .Black
    title = "Venues"
    presenter?.startUsingLocation()
  }
  
  private func addViewConnections() {
    wireframe = ResultWireFrame(viewProtocol: self)
  }
  
  func viewCanInit() {
  }
  
  func reloadMapWithRegion(region: MKCoordinateRegion?) {
    self.mapView.setRegion(region!, animated: true)
  }
  func reloadVenuesArray(venues: [VenueItem]?) {
    
    self.venues = venues
    self.collectionView.reloadData()
    addMarksToMap()
    addAnnotationsFromVenues()
  }
  private func addMarksToMap() {
    removeAnnotations()
  }
  private func removeAnnotations() {
    guard mapView.annotations.count != 0 else {
      return
    }
    mapView.removeAnnotations(mapView.annotations)
  }
  
  private func addAnnotationsFromVenues() {
    for (_, value) in venues!.enumerate() {
      let pinLocation = CLLocationCoordinate2DMake(value.latitude!, value.longitude!)
      let dropPin = MKPointAnnotation()
      dropPin.coordinate = pinLocation
      dropPin.title = value.name
      mapView.addAnnotation(dropPin)
    }
  }
}
