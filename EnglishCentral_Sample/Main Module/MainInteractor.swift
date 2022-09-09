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
        guard let url = URL(string: " https://places.demo.api.here.com/places/") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            <#code#>
        }
        
    }
    
    
}
