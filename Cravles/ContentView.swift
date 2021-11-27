//
//  ContentView.swift
//  Cravles
//
//  Created by Ardyansyah Wijaya on 22/11/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        NavigationView {
            
            TabView {
                MainScreen()
                    .tabItem {
                        Image(systemName: "leaf.circle")
                        Text("Exercise")
                }
                    .accentColor(.gray)
//                    .frame(width: .infinity, height: .infinity)
                    .ignoresSafeArea()
                
                MainScreen()
                    .tabItem {
                        Image(systemName: "gamecontroller.fill")
                        Text("Games")
                }
//                    .frame(width: .infinity, height: .infinity)
                    .ignoresSafeArea()

            }
            .accentColor(Color.pulsatingColor)
        }

    }

}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
