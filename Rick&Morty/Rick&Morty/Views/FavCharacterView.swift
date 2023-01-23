//
//  FavCharacterView.swift
//  Rick&Morty
//
//  Created by Manish Panta on 12/13/22.
//

import SwiftUI

struct FavCharacterView: View {
        var character: CharacterData
        @State private var response = false
        var body: some View {
            ZStack(alignment: .center) {
               
                
                VStack(alignment: .leading) {
                    
                    AsyncImage(
                        url: URL(string:character.image ?? ""),
                        content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 175, height: 175, alignment: .center)
                        }, placeholder: {
                            ProgressView()
                        }
                    )

                    .frame(width: 175, height: 175, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .overlay(RoundedRectangle(cornerRadius: 24.0)
                        .stroke(Color.gray, lineWidth: 1))
                    
                        HStack {
                            Text("ID:")
                            Text(String(character.id ?? ""))
                                
                                .font(.subheadline)
                                

                        }
                        
                        
                        HStack {
                            Text("Name:")
                            Text(character.name ?? "")
                                .font(.subheadline)
                        }
                    
                    HStack {
                        Text("Status:")
                        Text(character.status ?? "")
                            .font(.subheadline)
                    }
                    HStack {
                        Text("Gender:")
                        Text(character.gender ?? "")
                            .font(.subheadline)
                    }
                        
                        HStack {
                            Text("Species:")
                            Text(character.species ?? "")
                                .font(.subheadline)
                        }
                    HStack {
                        Text("Origin:")
                        Text(character.origin ?? "")
                            .font(.subheadline)
                    }
                    HStack {
                        Text("Current Location:")
                        Text(character.location ?? "")
                            .font(.subheadline)
                    }

                }
            
                  
            }
            
        
        }
    
    
}


