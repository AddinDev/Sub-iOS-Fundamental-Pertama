//
//  GameRow.swift
//  Submission Aplikasi Game Catalogue
//
//  Created by pasto on 01/07/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import SwiftUI

struct GameRow: View {
    
    var game: Game
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ImageLoad(url: game.image)
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading ,spacing: 0) {
                    Text(game.name)
                        .font(.system(size: 18))
                    HStack {
                        Image(systemName: "star.fill")
                            .offset(x: -5)
                        Text(String(game.rating))
                            .font(.footnote)
                    }
                }
                .padding(.leading, 8)
                
                Spacer()
            }
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            
            Text("Release: \(game.released)")
            
        }
    }
}



struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        GameRow(game: Networking().games[1]).previewLayout(.sizeThatFits)
    }
}
