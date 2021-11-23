//
//  ExerciseView.swift
//  Cravles
//
//  Created by Yani . on 22/11/21.
//

import SwiftUI

struct ExerciseView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var isLinkActive = false
    var body: some View {
        NavigationView {
            VStack {
                Text("Hi, John")
                Text("How are you feeling?")

                NavigationLink(destination: SimulationExerciseView(), isActive: $isLinkActive) {
                    Button(action: {
                        self.isLinkActive = true
                    }) {
                        Text("Next")
                    }
                }
            }
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
