//
//  LootApp.swift
//  Loot
//
//  Created by Florian PICHON on 19/01/2024.
//

import SwiftUI

@main
struct LootApp: App {
    @AppStorage("isOnboardingDone") var isOnboardingDone: Bool = false

      var body: some Scene {
          WindowGroup {
              if isOnboardingDone {
                  ContentView()
              } else {
                  OnboardingView()
              }
          }
      }
}
