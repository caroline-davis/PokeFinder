//
//  ViewController.swift
//  PokeFinder
//
//  Created by Caroline Davis on 26/07/2017.
//  Copyright © 2017 Caroline Davis. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
     let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        // map moves with the users location
        mapView.userTrackingMode = MKUserTrackingMode.follow
    }
    
    override func viewDidAppear(_ animated: Bool) {
        locationAuthStatus()
    }
    
    // checks to see if we have authorization in users location
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    // if user has not authorized us to see the location this fires off
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        }
    }
    
    // centers user location on map
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 2000, 2000)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    @IBAction func spotRandomPokemon(_ sender: AnyObject) {
    }

}

