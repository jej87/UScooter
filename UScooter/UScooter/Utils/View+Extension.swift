//
//  View+Extension.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/14/23.
//

import Foundation
import SwiftUI
 
extension View {
    func setupNavigationBarAppearance(titleColor: UIColor, barColor: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = barColor
        appearance.titleTextAttributes = [.foregroundColor: titleColor]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
