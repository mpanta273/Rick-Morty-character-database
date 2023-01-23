//
//  APIHelper.swift
//  Rick&Morty
//
//  Created by Manish Panta on 12/8/22.
//

import Foundation
import UIKit


enum URLError: Error {
    case BadURL, BadData
}

var BaseUrl = "https://rickandmortyapi.com/api/character"
class APIhelper: ObservableObject {
    
    func componentBuilder(with parameters: [String:String]) -> URL? {
        var queryItems = [URLQueryItem]()
        for (key, value) in parameters {
            let item = URLQueryItem(name: key, value: value.lowercased())
            queryItems.append(item)
        }
        
        guard var components = URLComponents(string: BaseUrl) else { return nil }
        components.queryItems = queryItems
        print(components.url as Any)
        return components.url
 
    }
    
    func fetchCharacter(name : String,  status : String,  species : String,  gender : String) async throws -> CharacterResponse {
        let params = [
            "name": name,
            "status": status,
            "species": species,
            "gender": gender,
            ]
        
        guard let url = componentBuilder(with: params) else { throw URLError.BadURL }

            let request = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw URLError.BadURL }
            
            let decoder = JSONDecoder()
            let characterResponse = try decoder.decode(CharacterResponse.self, from: data)
            return characterResponse
        
    }
    
    

    



}

