//
//  OnboardingPageView.swift
//  Loot
//
//  Created by Florian PICHON on 26/01/2024.
//

// OnboardingPageView.swift
import SwiftUI

struct OnboardingPageView: View {
    @Binding var currentPage: Int
    let index: Int
    let title: String
    let desc: String
    let image: String
    let colors: Color
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 70, weight: .bold))
                .padding()
                .multilineTextAlignment(.center)
            Circle()
                .fill(colors)
                .frame(height: 200)
                .overlay(
                    Image(systemName: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .foregroundColor(.white)
                )
                .padding()
            Text(desc)
                .font(.title2)
                .padding()
                .multilineTextAlignment(.center)
            Button(action: {
                           if index < 3 {
                               currentPage += 1
                           } else {
                               LootApp().isOnboardingDone = true
                               UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: ContentView())
                           }
                       }) {
                Text(index < 3 ? "Suivant" : "Commencer")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
            }
        }
    }
}

// Preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingView()
                .preferredColorScheme(.light)
                .previewDisplayName("Light Mode")
            OnboardingView()
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
