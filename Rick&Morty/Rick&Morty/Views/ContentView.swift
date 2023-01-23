//
//  ContentView.swift
//  Rick&Morty
//
//  Created by Manish Panta on 12/8/22.
//

import SwiftUI


struct ContentView: View {
    @AppStorage("status") var status = ""
    @AppStorage("gender") var gender = ""
    @AppStorage("name") var name = ""
    @State private var angle = 0.0
    @ObservedObject var notificationMgr = NotificationMgr()
    @State private var shouldAlert = false
    @AppStorage("species") var species = ""
    @AppStorage("colorScheme") var colorscheme = 0
    @State private var showProgress: Bool = false
    @ObservedObject var characterVM = CharacterVM()
        var body: some View {
            ZStack{
            NavigationView {
                TabView{
                   
                    CharacterListView(characterVM: characterVM)
                        .tabItem {
                            Label(TabType.list.title(), systemImage: TabType.list.image())
                        }

                    SettingsView()
                        .tabItem {
                            Label(TabType.settings.title(), systemImage: TabType.settings.image())
                        }
                    FavouriteView(characterVM: characterVM)
                        .tabItem{
                            Label(TabType.favourite.title(), systemImage: TabType.favourite.image())
                        }
                    
                    
                    InfoView()
                        .tabItem {
                            Label(TabType.info.title(), systemImage: TabType.info.image())
                        }
                }
                .preferredColorScheme(colorscheme == 1 ? .light : colorscheme == 2 ? .dark : nil)
                    .environmentObject(characterVM)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            notificationMgr.scheduleNotification()
                            angle += 45
                           getCharacters(name: name, status: status, species:species , gender:gender)
                           
                        }, label: {
                            Label("Apply Filters", systemImage: "gobackward")
                              
                        })
                        .rotationEffect(.degrees(angle))
                                .animation(.easeIn, value: angle)
                    }
                }
                .onAppear() {
                  
                    getCharacters(name: "", status: "", species:"" , gender:"")
                   
                }
            }
            }
        
        
}
    
    
    func getCharacters( name : String,  status : String,  species : String,  gender : String) {
        Task {
            showProgress = true
            await characterVM.update(name: name, status: status, species:species , gender:gender)
            showProgress = false
        }
    }

        
        
        }





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
