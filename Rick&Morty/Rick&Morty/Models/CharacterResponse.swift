//
//  Character.swift
//  Rick&Morty
//
//  Created by Manish Panta on 12/8/22.
//

import Foundation
import Metal

struct CharacterResponse: Decodable{
    let results:[result]
//    let info:information
}



struct result : Decodable, Identifiable{
    let id:Int
    let name:String
    let status:String
    let species:String
    let gender:String
    let image: String
    let origin: Origin
    let location: Location
   

    static let test = result(
        id: 2,
        name: "Rick Sanchez",
        status: "alive",
        species: "human",
        gender: "male",
        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
        origin: Origin(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
        location: Location(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"))
       
    
}

struct Origin :Decodable{
    let name: String
    let url: String
}
struct Location :Decodable{
    let name: String
    let url: String
}

