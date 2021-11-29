//
//  CravlesApp.swift
//  Cravles
//
//  Created by Ardyansyah Wijaya on 22/11/21.
//

import SwiftUI

@main
struct CravlesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Reflection1View()
            ExerciseView(data: Mood.moods.first!)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
