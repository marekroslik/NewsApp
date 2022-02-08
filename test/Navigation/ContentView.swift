//
//  ContentView.swift
//  test
//
//  Created by Marek Roslik on 28.01.22.
//

import SwiftUI


struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .news
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            switch selectedTab {
            case .news:
                HomeView()
            case .explore:
                ExploreView()
            }
            
            TabBar()
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 44)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
