//
//  PlacesResponse.swift
//  EnglishCentral_Sample
//
//  Created by Baran Göcen on 9.09.2022.
//

import Foundation


struct PlacesResponse : Decodable {
    
    let results: MyResult
    let search: Search
    

}

struct MyResult : Decodable {
    let next : String
    let items : [Item]
}

struct Search : Decodable {
    let context : Context
}

struct Context : Decodable {
    let location : Location
    let type : String
    let href : String
}

struct Location : Decodable {
    let position : [Float]
    let address : Address
    
}

class Item : Decodable { // Used class for faster segue
    
    let position : [Float]
    let distance : Int
    let tittle : String
    let avarageRating : Int
    let category : Category
    let icon : String
    let vicinity : String
    let address : Address
    let contacts : Contact
    let having : [String]
    let type : String
    let href : String
    let tags : [Tag]
    let id : String
    let access : [Access]
    let phonemes : Phonemes
    

    

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
    let position : [Float]
    let accessType : String
    let sideOfStreet : String
}

struct Phonemes : Decodable {
    let address : AddressPhonemes
}

struct AddressPhonemes : Decodable {
    let street : Street
    let district : District
}

struct Street : Decodable {
    let value : String
    let language : String
}

struct District : Decodable {
    
}
