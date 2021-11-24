//
//  ReflectioScreen.swift
//  Cravles
//
//  Created by Indah Nurindo on 24/11/2564 BE.
//

import SwiftUI
import CoreData


struct ReflectioScreen: View {
    
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Reflection.dateReflection, ascending: true)], animation: .default) private var reflections: FetchedResults<Reflection>
    
    @State private var recording = false
    @State private var reflectionField = ""
    @ObservedObject private var mic = MicMonitor(numberOfSamples: 30)
    
    private var speechManager = SpeechManager()
    
    var body: some View {
        ZStack{
            GeometryReader { h in
                
                
            }
        }
        
    }
}

struct ReflectioScreen_Previews: PreviewProvider {
    static var previews: some View {
        ReflectioScreen()
    }
}
