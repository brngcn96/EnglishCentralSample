//
//  Router.swift
//  EnglishCentral_Sample
//
//  Created by Baran Göcen on 9.09.2022.
//

import Foundation
import UIKit


protocol AnyRouter {
    

    static func startExecution(initialView : MainViewController)
    
}

class MainRouter : AnyRouter{

    

    var presenter: AnyPresenter?
    
    static func startExecution(initialView : MainViewController){

        var presenter : AnyPresenter = MainPresenter()
        
        presenter.interactor = MainInteractor()
        presenter.view = initialView
        initialView.presenter = presenter
        
        //initialView.presenter?.router = MainRouter()
        //initialView.presenter?.view = initialView.self
        
        //initialView.presenter?.interactor? = MainInteractor()
        //For interactor
        initialView.presenter?.interactor?.presenter = presenter

    }
    
    
}
