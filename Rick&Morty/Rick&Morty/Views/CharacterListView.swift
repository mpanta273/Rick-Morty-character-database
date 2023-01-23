//
//  CharacterListView.swift
//  Rick&Morty
//
//  Created by Manish Panta on 12/11/22.
//

import SwiftUI

struct CharacterListView: View {
   
    @ObservedObject var characterVM: CharacterVM
   
    var body: some View {
        NavigationView {
            
            if (characterVM.characterResponse)==nil{
                Text("No results. Try Again with Different Parameters")
            }
            else{
            List {
                ForEach(characterVM.characterResponse?.results ?? [result]()) { item in
                    NavigationLink {
                        CharacterView(character:item, characterVM: characterVM)
                    } label: {
                        HStack {
                            HStack {
                                AsyncImage(
                                    url: URL(string:item.image),
                                    content: { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    }, placeholder: {
                                        ProgressView()
                                        
                                    }
                                )
                                .frame(width: 75, height: 75, alignment: .center)
                                .clipShape(RoundedRectangle(cornerRadius: 24))
                                .overlay(RoundedRectangle(cornerRadius: 24.0)
                                    .stroke(Color.gray, lineWidth: 1))
                                VStack(alignment: .leading) {
                                    Text(item.name).fontWeight(.medium)
                                
                                }
                                Spacer()
                            }
                        }
                        }
                       
                    }
                 
                }

    }
   
        }
        .navigationTitle("Characters")
        .edgesIgnoringSafeArea([.top, .bottom])
        .navigationBarHidden(true)
        }

    
    


}


struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(characterVM: CharacterVM())
    }
}

