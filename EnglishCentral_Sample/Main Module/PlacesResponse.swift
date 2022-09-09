//
//  PlacesResponse.swift
//  EnglishCentral_Sample
//
//  Created by Baran Göcen on 9.09.2022.
//

import Foundation
import MapKit

class PlacesResponse : Decodable {
    
    let results: [Item]
    let status: String
    
    struct Item : Decodable {
        
        let position : MKGeoJSONObject
        let distance : Int
        let tittle : String
        let avarageRating : Int
        let category : Category
        let icon : String
        let vicinity : String
        let adress : Address
        let contacts : Contact
        let having : [Any]
        let type : String
        let href : String
        let tags : [Tag]
        let id : String
        let access : [Access]
        
        
        
        
        

    }
    
    struct Category : Decodable {
        
    }
    
    struct Contact : Decodable {
        let phone : [Phone]
        let website : [Website]
    }
    
    struct Phone : Decodable {
        let value : String
        let label : String
    }
    
    struct Website : Decodable {
        let value : String
        let label : String
    }

    
    struct Address : Decodable {
        let text : String
        let house : Int
        let street : String
        let postalCode : Int
        let district : String
        let city : String
        let state : String
        let country : String
        let countryCode : String
        
    }
    
    struct Tag : Decodable {
        let id : String
        let tittle : String
        let group : String
    }

    struct Access : Decodable {
        let position : MKGeoJSONObject
        let accessType : String
        let sideOfStreet : String
    }

}
