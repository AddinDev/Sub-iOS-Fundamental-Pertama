//
//  ContentView.swift
//  Submission Aplikasi Game Catalogue
//
//  Created by pasto on 30/06/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var networking = Networking()
    
    var body: some View {
        NavigationView {
            List(networking.games) { game in
                GameRow(game: game)
                NavigationLink(destination: Detail(game: game)) {
                    EmptyView()
                }
            }
            .navigationBarTitle("Game Catalogue", displayMode: .inline)
            .navigationBarItems(trailing:
                NavigationLink(destination: About(), label: {
                    Image(systemName: "person.crop.circle.fill")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 25, height: 25)
                    
                }))
                .onAppear(perform: self.networking.getData)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
