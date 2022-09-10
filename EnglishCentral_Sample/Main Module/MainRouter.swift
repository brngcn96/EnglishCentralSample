//
//  Router.swift
//  EnglishCentral_Sample
//
//  Created by Baran Göcen on 9.09.2022.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    
    var entry : EntryPoint? {get}
    static func startExecution() -> AnyRouter
    
}

class MainRouter : AnyRouter{
    var entry: EntryPoint?
    

    var presenter: AnyPresenter?
    
    static func startExecution() -> AnyRouter {
        let router = MainRouter()
        var view : AnyView = MainViewController()
        var presenter : AnyPresenter = MainPresenter()
        var interactor : AnyInteractor = MainInteractor()
        
        view.presenter = presenter
        presenter.router = router
        interactor.presenter = presenter
        router.entry = view as? EntryPoint
        
        return router
    }
    
    
}
