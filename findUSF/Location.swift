

import Foundation
import CoreLocation

struct Location: Codable, Identifiable {
    let id: Int
    let name: String
    let country: String
    let description: String
    let more: String
    let latitude: Double
    let longitude: Double
    let heroPicture: String
    let advisory: String
    let pictures: [String]
    //let coordinates: CLLocationCoordinate2D
    
    static let allLocations: [Location] = Bundle.main.decode("locations.json")

    
    
    static let example =  allLocations[0]
        //Location(id: 1, name: "Great Smokey Mountains", country: "United States", description: "A great place to visit.", more: "More text here.", latitude: 35.6532, longitude: -83.5070, heroPicture: "smokies", advisory: "Beware of the bears!", pictures: ["gillson"])
    
    
    //static let example = Location[0]
    
   // private var coordinates: Coordinates
//       var locationCoordinate: CLLocationCoordinate2D {
//           CLLocationCoordinate2D(
//               latitude: coordinates.latitude,
//               longitude: coordinates.longitude)
//       }

//       struct Coordinates: Hashable, Codable {
//           var latitude: Double
//           var longitude: Double
//       }
}

class LocationViewModel: ObservableObject {
    @Published var list: [Location] = Location.allLocations
    
    func sortByName() {
        list.sort { (lhs: Location, rhs: Location) -> Bool in
            lhs.name < rhs.name
        }
    }
    
    func sortByCountry() {
        list.sort { (lhs: Location, rhs: Location) -> Bool in
            lhs.country < rhs.country
        }
    }
    
    func sortByDefault() {
        list = Location.allLocations
    }
}
