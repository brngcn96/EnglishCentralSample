//
//  PlacesResponse.swift
//  EnglishCentral_Sample
//
//  Created by Baran Göcen on 9.09.2022.
//

import Foundation


struct PlacesResponse : Codable {
    
    let results: MyResult
    let search: Search?
    
    enum CodingKeys: String, CodingKey{
          case results = "results"
          case search  = "search"
      }
    

}

struct MyResult : Codable {
    let next : String
    let items : [Item]
    
    enum CodingKeys: String, CodingKey{
          case next = "next"
          case items  = "items"
      }
    
    
}

struct Search : Codable {
    let context : Context
    
    enum CodingKeys: String, CodingKey{
          case context = "context"

      }
}

struct Context : Codable {
    let location : Location
    let type : String
    let href : String
    
    enum CodingKeys: String, CodingKey{
          case location = "location"
          case type = "type"
          case href = "href"

      }
}

struct Location : Codable {
    let position : [Float]
    let address : AddressLocation
    
    enum CodingKeys: String, CodingKey{
          case position = "position"
          case address = "address"

      }
    
}

struct Item : Codable { // Used class for faster segue
    
    let position : [Float]
    let distance : Int
    let title : String
    let avarageRating : Int?
    let category : Category
    let icon : String
    let vicinity : String
    let address : Address
    let contacts : Contact
    let having : [String]
    let type : String
    let href : String
    let tags : [Tag]?
    let id : String
    let access : [Access]
    let openingHours : OpeningHours?
    let phonemes : Phonemes?
    
    
    enum CodingKeys: String, CodingKey{
          case position = "position"
          case distance = "distance"
          case title  = "title"
        case avarageRating = "averageRating"
        case category = "category"
        case icon = "icon"
        case vicinity = "vicinity"
        case address = "address"
        case contacts = "contacts"
        case having = "having"
        case type = "type"
        case href = "href"
        case tags = "tags"
        case id = "id"
        case access = "access"
        case openingHours = "openingHours"
        case phonemes = "phonemes"
      }
    

    

}

struct Category : Codable {
    let id : String
    let title : String
    let href : String
    let type : String
    let system: String
    
    
    enum CodingKeys: String, CodingKey{
          case id = "id"
          case title = "title"
          case href  = "href"
          case type = "type"
          case system = "system"

      }
    
    
}

struct OpeningHours : Codable {
    let text : String
    let label : String
    let isOpen : Bool
    let structured : [Structured]
    
    
}

struct Structured : Codable {
    let start : String
    let duration : String
    let recurrence : String
    
    enum CodingKeys: String, CodingKey{
          case start = "start"
          case duration = "duration"
          case recurrence  = "recurrence"

    }
}

struct Contact : Codable {
    let phone : [Phone]
    let website : [Website]
    
    
    enum CodingKeys: String, CodingKey{
          case phone = "phone"
          case website = "website"

    }
    
}

struct Phone : Codable {
    let value : String
    let label : String
    
    enum CodingKeys: String, CodingKey{
          case value = "value"
          case label = "label"

    }
}

struct Website : Codable {
    let value : String
    let label : String
    
    enum CodingKeys: String, CodingKey{
          case value = "value"
          case label = "label"

    }
}


struct Address : Codable {
    let text : String
    let house : String?
    let street : String
    let postalCode : String
    let district : String
    let city : String
    let state : String
    let country : String
    let countryCode : String
    
    
    enum CodingKeys: String, CodingKey{
        case text = "text"
        case house = "house"
        case street  = "street"
        case postalCode = "postalCode"
        case district = "district"
        case city = "city"
        case state = "state"
        case country = "country"
        case countryCode = "countryCode"

      }
    

    
}


struct AddressLocation : Codable {
    let text : String
    let house : String
    let street : String
    let postalCode : String
    let district : String
    let city : String
    let stateCode : String
    let country : String
    let countryCode : String
    
    
    enum CodingKeys: String, CodingKey{
        case text = "text"
        case house = "house"
        case street  = "street"
        case postalCode = "postalCode"
        case district = "district"
        case city = "city"
        case stateCode = "stateCode"
        case country = "country"
        case countryCode = "countryCode"

      }
    

    
}





struct Tag : Codable {
    let id : String
    let title : String
    let group : String
    
    enum CodingKeys: String, CodingKey{
          case id = "id"
          case title = "title"
          case group = "group"

    }
}

struct Access : Codable {
    let position : [Float]
    let accessType : String
    let sideOfStreet : String
    
    enum CodingKeys: String, CodingKey{
          case position = "position"
          case accessType = "accessType"
          case sideOfStreet = "sideOfStreet"

    }
}

struct Phonemes : Codable {
    let address : AddressPhonemes
    
    enum CodingKeys: String, CodingKey{
          case address = "address"

    }
}

struct AddressPhonemes : Codable {
    let street : [Street]?
    let district : [District]
    
    enum CodingKeys: String, CodingKey{
          case street = "street"
          case district = "district"

    }
}

struct Street : Codable {
    let value : String
    let language : String
    
    enum CodingKeys: String, CodingKey{
          case value = "value"
          case language = "language"

    }
}

struct District : Codable {
    let value : String
    let language : String
    
    enum CodingKeys: String, CodingKey{
          case value = "value"
          case language = "language"

    }
    
}
