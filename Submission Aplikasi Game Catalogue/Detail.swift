//
//  Detail.swift
//  Submission Aplikasi Game Catalogue
//
//  Created by pasto on 30/06/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import SwiftUI

struct Detail: View {
    var game: Game
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 0) {
                ImageLoad(url: game.image)
                    .frame(height: 250)
                    .aspectRatio(contentMode: .fit)
                
                HStack {
                    VStack(alignment: .center ,spacing: 0) {
                        Text("Release Date")
                            .font(.footnote)
                            .fontWeight(.medium)
                        Text(game.released)
                            .font(.footnote)
                    }
                    .padding()
                    
                    Spacer()
                    HStack(spacing: 0) {
                        Image(systemName: "star.fill")
                            .offset(x: -5)
                        Text(String(game.rating))
                            .font(.footnote)
                    }
                    .padding()
                }
                    
                    
                .padding()
                Spacer()
            }
            .navigationBarTitle("\(game.name)", displayMode: .inline)
        }
    }
}


