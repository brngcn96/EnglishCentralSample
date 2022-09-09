//
//  Interactor.swift
//  EnglishCentral_Sample
//
//  Created by Baran Göcen on 9.09.2022.
//

import Foundation


protocol AnyInteractor{
    var presenter : AnyPresenter? {get set}
    func downloadLocations()
}


class MainInteractor : AnyInteractor{
    var presenter: AnyPresenter?
    
    func downloadLocations() {
        guard let url = URL(string: "https://places.demo.api.here.com/places/v1/discover/explore?at=52.5310%2C13.3848&app_id=DemoAppId01082013GAL&app_code=AJKnXv84fjrb0KIHawS0Tg") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                print(data)
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                
                if let locations = json["items"] as 
                self.presenter?.interactorDidDownloadLocation(result: .success(locations))
            } catch  {
                self.presenter?.interactorDidDownloadLocation(result: .failure(NetworkError.parsingFailed))
            }

        }
        
        task.resume()
        
    }
    
    
}
