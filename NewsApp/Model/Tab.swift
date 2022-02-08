import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
    var color: Color
}

var tabItems = [
    TabItem(text: "News", icon: "newspaper", tab: .news, color: .blue),
    TabItem(text: "Explore", icon: "magnifyingglass", tab: .explore, color: .purple)
]

enum Tab: String {
    case news
    case explore
}

struct TabPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
