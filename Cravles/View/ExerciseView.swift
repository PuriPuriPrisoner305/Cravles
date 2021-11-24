//
//  ExerciseView.swift
//  Cravles
//
//  Created by Yani . on 22/11/21.
//

import SwiftUI

struct ExerciseView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State var width : CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
    
    @State var isLinkActive = false

    var body: some View {
        NavigationView {
            VStack (spacing: 20) {
                Text("Hi, John")
                    .font(Font.system(.title, design: .rounded))
                    .fontWeight(.medium)

                Text("How are you feeling?")
                    .font(Font.system(.title3, design: .rounded))
                    .fontWeight(.regular)

//                Spacer(minLength: 0)

                NavigationLink(destination: ExercisePlayView(), isActive: $isLinkActive) {
                    Button(action: {
                        self.isLinkActive = true
                    }) {
                        Text("Happy")
                            .font(Font.system(.body, design: .rounded))
                            .fontWeight(.regular)
                            .frame(width: UIScreen.main.bounds.width - 120 , alignment: .center)
                    }
                    .buttonStyle(BlueButton())
                    
                }

                NavigationLink(destination: ExercisePlayView(), isActive: $isLinkActive) {
                    Button(action: {
                        self.isLinkActive = true
                    }) {
                        Text("Feeling Good")
                            .font(Font.system(.body, design: .rounded))
                            .fontWeight(.regular)
                            .frame(width: UIScreen.main.bounds.width - 120 , alignment: .center)
                    }
                    .buttonStyle(BlueButton())
                }

                NavigationLink(destination: ExercisePlayView(), isActive: $isLinkActive) {
                    Button(action: {
                        self.isLinkActive = true
                    }) {
                        Text("Neutral")
                            .font(Font.system(.body, design: .rounded))
                            .fontWeight(.regular)
                            .frame(width: UIScreen.main.bounds.width - 120 , alignment: .center)
                    }
                    .buttonStyle(BlueButton())
                }

                NavigationLink(destination: ExercisePlayView(), isActive: $isLinkActive) {
                    Button(action: {
                        self.isLinkActive = true
                    }) {
                        Text("Anxious")
                            .font(Font.system(.body, design: .rounded))
                            .fontWeight(.regular)
                            .frame(width: UIScreen.main.bounds.width - 120 , alignment: .center)
                    }
                    .buttonStyle(BlueButton())
                }

                NavigationLink(destination: ExercisePlayView(), isActive: $isLinkActive) {
                    Button(action: {
                        self.isLinkActive = true
                    }) {
                        Text("Stress")
                            .font(Font.system(.body, design: .rounded))
                            .fontWeight(.regular)
                            .frame(width: UIScreen.main.bounds.width - 120 , alignment: .center)
                    }
                    .buttonStyle(BlueButton())

                }

                Spacer(minLength: 0)
            }
        }
    }
}

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .cornerRadius(15)
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
