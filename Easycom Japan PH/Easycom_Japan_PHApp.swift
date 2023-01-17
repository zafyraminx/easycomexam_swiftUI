//
//  Easycom_Japan_PHApp.swift
//  Easycom Japan PH
//
//  Created by Michael Angelo Zafra on 1/16/23.
//

import SwiftUI

@main
struct Easycom_Japan_PHApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = HomeViewModel()
            HomeScreen().environmentObject(viewModel)
        }
    }
}
