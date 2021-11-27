//
//  Reflection1View.swift
//  Cravles
//
//  Created by Indah Nurindo on 25/11/2564 BE.
//

import SwiftUI
import CoreData

struct Reflection1View: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Reflection.entity(), sortDescriptors:
                    [NSSortDescriptor(keyPath: \Reflection.dateReflection, ascending: false)]) var reflections: FetchedResults<Reflection>
    @State private var showingAdd = false
    var body: some View {
        NavigationView{
            List{
                ForEach(reflections, id:\.self) {
                    reflection in
                    HStack{
                        
                    }
                }
            }
        }
    }
}

struct Reflection1View_Previews: PreviewProvider {
    static var previews: some View {
        Reflection1View()
    }
}
