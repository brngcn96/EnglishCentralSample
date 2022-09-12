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
    
    func updateView(with locationItems : [Item])
    func updateView(with error : String)
    
}

class MainViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate,AnyView {
    
 
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    var presenter: AnyPresenter?
    
    var locationsItems : [Item] = []
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        //MainRouter.startExecution(initialView: self)
        MainRouter.startExecution(initialView: self)
        self.presenter!.interactor!.downloadLocations()
        
        //apiTest()
        
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

    func updateView(with locationItems: [Item]) {
        DispatchQueue.main.async {
            self.locationsItems = locationItems
            print(locationItems[0].address.country)
        }
    }
    
    func updateView(with error: String) {
        DispatchQueue.main.async {
            self.locationsItems = []
        }
    }

    
    
    func apiTest(){
        
        guard let url = URL(string: "https://places.demo.api.here.com/places/v1/discover/explore?at=52.5310%2C13.3848&Accept-Language=en-US%2Cen%3Bq%3D0.9&app_id=DemoAppId01082013GAL&app_code=AJKnXv84fjrb0KIHawS0Tg") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                
                let locations = try JSONDecoder().decode(PlacesResponse.self,from: data)
                //print(locations.results.items[0].title)
            
                

            } catch  {
                print(error)
            }
            
        }
        
        task.resume()
        
    }

}


