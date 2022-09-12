//
//  Presenter.swift
//  EnglishCentral_Sample
//
//  Created by Baran Göcen on 9.09.2022.
//

import Foundation
import UIKit

enum NetworkError : Error {
    case networkFailed
    case parsingFailed
}


protocol AnyPresenter {
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set }
    
    func interactorDidDownloadLocation(result :Result<[Item],Error>)
    
}

class MainPresenter : AnyPresenter {
    var view: AnyView?
    
    var router: AnyRouter?
    
    var interactor: AnyInteractor?

    
    
    func interactorDidDownloadLocation(result: Result<[Item], Error>) {
        
        
        switch result {
        case .success(let locations):
            view?.updateView(with: locations)
            
            
        case .failure(let error):
            view?.updateView(with: error.localizedDescription)
            print(error)
        
        }
    }
    
}
