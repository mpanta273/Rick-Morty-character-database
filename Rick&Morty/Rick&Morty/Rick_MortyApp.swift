//
//  Rick_MortyApp.swift
//  Rick&Morty
//
//  Created by Manish Panta on 12/8/22.
//

import SwiftUI

@main
struct Rick_MortyApp: App {
    @StateObject private var persistence = Persistence()
    @StateObject var characterVM = CharacterVM()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
    }
}
