//
//  WorldView.swift
//

import MapKit
import SwiftUI
import SDWebImageSwiftUI
struct WorldView: View {
    
    @EnvironmentObject var locations: Locations
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7761, longitude: -122.4507),
        span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        
    )
   

    var body: some View {
        
        Map(coordinateRegion: $region, annotationItems: locations.places) { location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                NavigationLink(destination: ContentView(location: location)) {
//                    Image(location.heroPicture)
//                        //CHANGE IMAGE CODE HERE^
//                        .resizable()
//                        .cornerRadius(10)
//                        .frame(width: 80, height: 40)
//                        .shadow(radius: 3)
                    AsyncImage(url: URL(string: "\(location.heroPicture)")) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 80, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 3)
                        .cornerRadius(10)
                        .scaledToFit()
//                    WebImage(url: URL(string: location.heroPicture))
//
//                       // Supports options and context, like `.delayPlaceholder` to show placeholder only when error
//                       .onSuccess { image, data, cacheType in
//                           // Success
//                           // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
//                       }
//
//                       .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
//
//                       .placeholder(Image(systemName: "photo")) // Placeholder Image
//                       // Supports ViewBuilder as well
//                       .placeholder {
//                           Rectangle().foregroundColor(.gray)
//                       }
//                       .indicator(.activity) // Activity Indicator
//                       .transition(.fade(duration: 0.5)) // Fade Transition with duration
//
//                       .frame(width: 80, height: 50, alignment: .center)
//
////                        .clipShape(
////                        RoundedRectangle(cornerRadius: 10))
//                        .shadow(radius: 3)
//                        .cornerRadius(10)
//                        .scaledToFit()
//

                    
                }
                
            }
        }
        .navigationTitle("Hilltop Map")
        
        
        
    }
}

struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView()
    }
}
