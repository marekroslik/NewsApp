//
//  PreferenceKeys.swift
//  test
//
//  Created by Marek Roslik on 2.02.22.
//

import SwiftUI

struct ScrollPreferenceKeys: PreferenceKey {
    static var defaultValue: CGFloat  = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
