//
//  FavouriteView.swift
//  Rick&Morty
//
//  Created by Manish Panta on 12/13/22.
//

import SwiftUI


struct FavouriteView: View {
    
    @ObservedObject var characterVM: CharacterVM
    @State private var del = false
    @State private var alert = false
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \CharacterData.date, ascending: false)],
        animation: .default)
    private var items: FetchedResults<CharacterData>
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                       FavCharacterView(character:item)
                    } label: {
                        HStack {
                            HStack {
                                AsyncImage(
                                    url: URL(string:item.image ?? ""),
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
                                    Text(item.name ?? "").fontWeight(.medium)
                                
                                }
                                Spacer()
                            }
                        }
                    }
                }.onDelete(perform: deleteItems)
            }.toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        del.toggle()
                        alert = true
                    }, label: {
                        Label("Delete", systemImage: del ? "trash.fill" : "trash")
                            .foregroundColor(.red)
                    }).alert("Delete all your favourites. This action is not undoable and will delete all your data.", isPresented: $alert, actions: {
                        Button("OK", role: .destructive, action: {
                            if !items.isEmpty{
                                deleteItems(offsets: IndexSet([0, items.count-1]))
                            }
                           
                            del.toggle()
                        })
                        
                        Button("Cancel", role: .cancel, action: {
                            del.toggle()
                        })
                    })
                }
            }

        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    
}

}
