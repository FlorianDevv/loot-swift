//
//  OnboardingView.swift
//  Loot
//
//  Created by Florian PICHON on 26/01/2024.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 1

    var body: some View {
        TabView(selection: $currentPage) {
            OnboardingPageView(currentPage: $currentPage, index: 1, title: "Gérer ses Loots", desc: "Ajouter facilement vos trouvaille et vos achats à votre collection personnelle" , image: "gym.bag.fill", colors: Color.blue)
                .tag(1)
            OnboardingPageView(currentPage: $currentPage, index: 2, title: "Votre wishlist", desc: "Créer une liste de souhait pour garder une trace des articles que vous souhaitez aquérir" , image: "wand.and.stars", colors: Color.purple)
                .tag(2)
            OnboardingPageView(currentPage: $currentPage, index: 3, title: "En un coup d'oeil", desc: "Accéder rapidement à vos fonctionnalité clés depuis l'écran d'acceuil de votre appareil" , image: "iphone", colors: Color.yellow)
                .tag(3)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#Preview {
    OnboardingView()
}
