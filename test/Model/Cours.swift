//
//  Cours.swift
//  test
//
//  Created by Marek Roslik on 3.02.22.
//

import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var logo: String
}

var courses = [
    Course(title: "1 Title", subtitle: "1 Subtitle", text: "1 Text", image: "Illustration 1", logo: "Logo 1"),
    Course(title: "2 Title", subtitle: "2 Subtitle", text: "2 Text", image: "Illustration 2", logo: "Logo 2"),
    Course(title: "3 Title", subtitle: "3 Subtitle", text: "3 Text", image: "Illustration 3", logo: "Logo 3"),
    Course(title: "4 Title", subtitle: "4 Subtitle", text: "4 Text", image: "Illustration 4", logo: "Logo 4"),
    Course(title: "5 Title", subtitle: "5 Subtitle", text: "5 Text", image: "Illustration 5", logo: "Logo 1")
]
