//
//  CharacterVM.swift
//  Rick&Morty
//
//  Created by Manish Panta on 12/11/22.
//


import Foundation


class CharacterVM: ObservableObject {
    
  
    var name: String = ""
    var id: String = ""
    var status: String = ""
    var gender: String = ""
    var species: String = ""
    var image: String = ""
    var isFav: Bool = false
    var identity = UUID()
    

    private var resp: CharacterResponse? = nil
    @Published var characterResponse: CharacterResponse?
    private let apiHelper = APIhelper()
    

    
    func update( name : String,  status : String,  species : String,  gender : String) async {
        characterResponse = nil
        do {
            resp = try await apiHelper.fetchCharacter(name: name, status: status, species:species , gender:gender)
            await MainActor.run {
                characterResponse = resp
            }
        } catch { print(error) }
    }
    

    
   
}


