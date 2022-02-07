//
//  SwiftUIView.swift
//  NewsApp
//
//  Created by Marek Roslik on 7.02.22.
//

import SwiftUI

struct SwiftUIView: View {
    @State var pickedNumber: Int?
    @Namespace var namespace
    
    var body: some View {
        VStack {
            if pickedNumber == nil {
                VStack(spacing: 15) {
                    ForEach(0..<3) { number in
                        Button("Hello world \(number)") {
                            withAnimation {
                                pickedNumber = number
                            }
                        }
                        .frame(width: 300, height: 30, alignment: .center)
                        .padding()
                        .border(Color.black, width: 1)
                        .matchedGeometryEffect(id: number, in: namespace)
                    }
                }
            } else {
                ForEach(0..<3) { number in
                    if pickedNumber == number {
                        ZStack {
                            Rectangle().foregroundColor(.blue).cornerRadius(30)
                            Button("Back") {
                                withAnimation {
                                    pickedNumber = nil
                                }
                            }
                            .padding()
                            .foregroundColor(.black)
                        }
                        .matchedGeometryEffect(id: number, in: namespace)
                    }
                }
            }
        }
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
