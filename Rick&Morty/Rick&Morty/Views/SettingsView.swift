//
//  SettingsView.swift
//  Rick&Morty
//
//  Created by Manish Panta on 12/8/22.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("name") var name = ""
    @AppStorage("status") var status = ""
    @AppStorage("gender") var gender = ""
    @AppStorage("species") var species = ""
    @AppStorage("colorScheme") var colorscheme = 0
   
    enum GenderType: String, CaseIterable, Identifiable {
        case Male
        case Female
        case Genderless
        case Unknown
        var id: String { self.rawValue }
    }
    
    enum StatusType: String, CaseIterable, Identifiable {
        case Dead
        case Alive
        case Unknown
        var id: String { self.rawValue }
    }

    
    var body: some View {
        NavigationView {
            Form {
                Section("Appearance") {
                    Picker(selection: $colorscheme, label: Text("Appearance")) {
                        Text("System").tag(0)
                        Text("Light").tag(1)
                        Text("Dark").tag(2)
                    }
                    .pickerStyle(.segmented)
                }
                Section("Status") {
                    Picker("Please choose status of the character", selection: $status) {
                        ForEach(StatusType.allCases) { element in
                          Text(element.rawValue)
                                   }
                               }
        
                    .pickerStyle(WheelPickerStyle())
                }
                Section("Gender") {
                    Picker("Please choose gender of the character", selection: $gender) {
                        ForEach(GenderType.allCases) { element in
                          Text(element.rawValue)
                                   }
                               }
        
                    .pickerStyle(WheelPickerStyle())
                }
                
                Section("Search By Name") {
                    TextField("Name", text: $name)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .textFieldStyle(.roundedBorder)
                }

            .navigationBarHidden(true)
            .navigationBarTitle(Text("Settings"))
        }
      
    }
    
    }
    

}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

