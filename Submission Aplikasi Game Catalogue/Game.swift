
import UIKit

struct Games: Codable {
    
    let games: [Game]
    
    enum CodingKeys: String, CodingKey {
        case games = "results"
        
    }
}

struct Game: Codable, Identifiable {
    let id: Int
    let gamePath: String
    let name: String
    let released: String
    let image: String
    let rating: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case gamePath
        case name
        case released
        case image = "background_image"
        case rating
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        
        let id = try container.decode(Int.self, forKey: .id)
        gamePath = "https://api.rawg.io/api/games/\(id)"
        
        name = try container.decode(String.self, forKey: .name)
        
        released = try container.decode(String.self, forKey: .released)
        
        image = try container.decode(String.self, forKey: .image)
        
        rating = try container.decode(Double.self, forKey: .rating)
        
    }
}
