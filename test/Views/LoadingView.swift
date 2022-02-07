//
//  LoadingView.swift
//  NewsApp
//
//  Created by Marek Roslik on 4.02.22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .secondary))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
       
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
