//
//  ContentData.swift
//  Cravles
//
//  Created by Indah Nurindo on 22/11/2564 BE.
//

import Foundation

struct ContentData: Hashable, Identifiable {
    let id: Int
    let nameExercise: String
    let descExercise: String
    let timeExercise: Int
    let imageExercise: String

    static let ContentDatas: [ContentData] = [ContentData(id: 0, nameExercise: "Breatging", descExercise: "mmm", timeExercise: 60, imageExercise: "imgg"),
                                              ContentData(id: 1, nameExercise: "me", descExercise: "njnj", timeExercise: 900, imageExercise: "hjhj")
    ]
}
