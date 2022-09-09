//
//  ViewController.swift
//  EnglishCentral_Sample
//
//  Created by Baran Göcen on 9.09.2022.
//

import UIKit
import MapKit


protocol AnyView{
    var presenter : AnyPresenter? {get set}
    
    func updateView(with locations : [LocationEntity])
    func updateView(with error : String)
    
}

class MainViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate,AnyView {
    
 
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    
    
    var presenter: AnyPresenter?
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    func updateView(with locations: [LocationEntity]) {
        <#code#>
    }
    
    func updateView(with error: String) {
        <#code#>
    }


}


