//
//  CharacterView.swift
//  Rick&Morty
//
//  Created by Manish Panta on 12/11/22.
//

import SwiftUI

struct CharacterView: View {
    var character: result
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var characterVM: CharacterVM
    @State private var showActionSheet = false
    @Environment(\.dismiss) var dismiss
    @State private var response = false
    @State var isAnimating : Bool = false
    var body: some View {
        ZStack(alignment: .center) {
           
            
            VStack(alignment: .leading) {
                
                AsyncImage(
                    url: URL(string:character.image),
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
                        Text(String(character.id))
                            
                            .font(.subheadline)
                            

                    }
                    
                    
                    HStack {
                        Text("Name:")
                        Text(character.name)
                            .font(.subheadline)
                    }
                
                HStack {
                    Text("Status:")
                    Text(character.status)
                        .font(.subheadline)
                }
                HStack {
                    Text("Gender:")
                    Text(character.gender)
                        .font(.subheadline)
                }
                    
                    HStack {
                        Text("Species:")
                        Text(character.species)
                            .font(.subheadline)
                    }
                HStack {
                    Text("Origin:")
                    Text(character.origin.name)
                        .font(.subheadline)
                }
                HStack {
                    Text("Current Location:")
                    Text(character.location.name)
                        .font(.subheadline)
                }

            }
            
              
        }
.toolbar {
    ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: {
            
           showActionSheet = true
           
        }, label: {
            Label("Add to Watchlist", systemImage: response ? "heart.fill" : "heart")
                .padding()
                .foregroundColor(.red)
                
        }).padding()
            .actionSheet(isPresented: $showActionSheet, content: {
                    ActionSheet(title: Text("Favorite"),
                            message: Text("Add this character to favorite?"),
                            buttons: [
                                .default(Text("Yes").foregroundColor(.blue)) {
//                                    if (characterVM.isFav == false){
//                                        characterVM.isFav = true
//                                        response.toggle()
                                        addCharacter()
                                    //}
                      },
                                .destructive(Text("No").foregroundColor(.red)) {
                      },
                      .cancel()
                    ])
                })
    }
    
}
    }
    
    private func addCharacter() {
        
        withAnimation {
            let newItem = CharacterData(context: viewContext)
            newItem.identity = UUID()
            newItem.id = String(character.id)
            newItem.name = character.name
            newItem.status = character.status
            newItem.gender = character.gender
            newItem.origin = character.origin.name
            newItem.location = character.location.name
            newItem.image = character.image
            newItem.isFav = characterVM.isFav
            
           
            do {
                try viewContext.save()
                dismiss()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
            
        
    }
}

