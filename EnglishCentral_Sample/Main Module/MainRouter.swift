//
//  Router.swift
//  EnglishCentral_Sample
//
//  Created by Baran Göcen on 9.09.2022.
//

import Foundation

protocol AnyRouter {
    var presenter : AnyPresenter? {get set}
    static func startExecution() -> AnyRouter
    
}

class MainRouter : AnyRouter{
    var presenter: AnyPresenter?
    
    static func startExecution() -> AnyRouter {
        let router = MainRouter()
        return router
    }
    
    
}
