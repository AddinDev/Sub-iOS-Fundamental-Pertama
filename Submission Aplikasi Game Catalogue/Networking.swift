//
//  Networking.swift
//  Submission Aplikasi Game Catalogue
//
//  Created by pasto on 01/07/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import SwiftUI
import Combine

class Networking: ObservableObject {
    
    @Published var games = [Game]()
    
    func getData() {
        let components = URLComponents(string: "https://api.rawg.io/api/games")!
        
        let request = URLRequest(url: components.url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else { return }
            
            if response.statusCode == 200 {
                decodeJSON(data: data)
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        
        task.resume()
        
        func decodeJSON(data: Data) {
            let decoder = JSONDecoder()
            
            let games = try! decoder.decode(Games.self, from: data)
            DispatchQueue.main.async {
                self.games = games.games
            }
            
            print(games.games)
            
            games.games.forEach { game in
                print("TITLE: \(game.name)")
                print("ID: \(game.id)")
                print("PATH: \(game.gamePath)")
                print("IMAGE: \(game.image)")
            }
        }
    }
    
    //ngambil poto game
    @Published var downloadImage: UIImage?
    
    func fetchImage(url: String) {
        guard let imageURL = URL(string: url) else {
            fatalError("The url is not valid")
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else {
                fatalError("error reading image")
            }
            
            DispatchQueue.main.async {
                self.downloadImage = UIImage(data: data)
                
            }
        }.resume()
    }
}
