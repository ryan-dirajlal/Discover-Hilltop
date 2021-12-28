//
//  ContentView.swift
//

import MapKit
import SwiftUI
import SDWebImageSwiftUI


struct ContentView: View {
    @State var location: Location
    @State var items : [Any] = []
    @State var sheet = false
    @State var w:CGFloat = 150
    @State var h:CGFloat = 120
    @State private var isSharePresented = false

    
    
    @EnvironmentObject var locations: Locations
//    @State var region = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 37.7765, longitude: -122.4489),
//        span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
//    )
    
    

    var body: some View {

        
        
        //POTENTIALLY make this a variable so we dont have to write it each time:
//       let image = WebImage(url: URL(string: location.heroPicture))
       
     //   let lat = location.latitude
       // let long = location.longitude
                ScrollView {
                    VStack
                    {
                        //AsyncImage(url: URL(string: "\(location.heroPicture)"))
                        AsyncImage(url: URL(string: "\(location.heroPicture)")) { image in
                            image.resizable()
                        } placeholder: {
                            Color.gray
                        }
                        .scaledToFit()
                        .onTapGesture {
                            print("hi")
                        }
                      
//                        WebImage(url: URL(string: location.heroPicture))
//                           .onSuccess { image, data, cacheType in
//                           }
//
//                           .resizable()
//                           .placeholder(Image(systemName: "photo"))
//                           .placeholder {
//                               Rectangle().foregroundColor(.gray)
//                           }
//                           .indicator(.activity)
//                           .transition(.fade(duration: 0.5)) // Fade Transition with duration
//                           .scaledToFit()
                           
                    
                        HStack{
                   
                    Text(location.name)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                            Button {
                                       self.isSharePresented = true
                            } label:{ Image(systemName: "square.and.arrow.up")}
                                   .sheet(isPresented: $isSharePresented, onDismiss: {
                                       print("Dismiss")
                                   }, content: {
                                       ActivityViewController(activityItems: [URL(string: "\(location.heroPicture)")!])
                                   })
                            
//                            Button(action: {
//                                //adding items to be shared...
//                                
//                             
//                                items.removeAll()
//                                items.append(UIImage(named : location.heroPicture)!)
//                                
//                                
//                                sheet.toggle()
//                                
//                                
//                            }, label : {
//                                Image(systemName: "square.and.arrow.up")
//                            })
                            
                        }
                        .navigationTitle("Building Info")
                    }
                    VStack{
                        
                     //Building name:
                    Text(location.country)
                        .font(.title)
                        .foregroundColor(.secondary)
                       
                     //accessible by who on campus
                    Text("Accessible By: " + location.advisory)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        .padding()

                    Text(location.description)
                        .padding(.horizontal)

                    Text("Fun Facts:")
                        .font(.title3)
                        .bold()
                        .padding(.top)
                        
                        //more facts
                        Text(location.more)
                            .padding(.horizontal)
                        
                        
                        //Additional building photos
                        Text("More Images:")
                            .font(.title3)
                            .bold()
                            .padding(.top)
                        Text("Tap to enlarge")
                        ScrollView(.horizontal , showsIndicators: false)
                        {
                            HStack{

                                ForEach(location.pictures, id:\.self) { pictures in
                                    
                                    AsyncImage(url: URL(string: "\(location.heroPicture)")) { image in
                                        image.resizable()
                                    } placeholder: {
                                        Color.gray
                                    }
                                    .frame(width: w, height: h)
                                    .shadow(radius: 3)
                                    .cornerRadius(10)
                                    .onTapGesture {
                                        if w == 150{
                                            w += 200
                                            h += 200
                                        }
                                        else{
                                            w -= 200
                                            h -= 200
                                        }
                                    }
                                    
//                                    WebImage(url: URL(string: pictures))
//                                       .onSuccess { image, data, cacheType in
//                                       }
//
//                                       .resizable()
//                                       .placeholder(Image(systemName: "photo"))
//                                       .placeholder {
//                                           Rectangle().foregroundColor(.gray)
//                                       }
//                                       .indicator(.activity)
//                                       .transition(.fade(duration: 0.5)) // Fade Transition with duration
//                                        .frame(width: 150, height: 120, alignment: .center)
//                                        .shadow(radius: 3)
//                                        .cornerRadius(10)
//                                        .scaledToFit()

                        }
                            }
                            .padding(.leading, 10.0)
                        }
                        
                        //USE THE ABOVE
                    
//                        Map(coordinateRegion: $region, annotationItems: locations.places) { location in
//                            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
//                                NavigationLink(destination: ContentView(location: location)) {
////
////
//                                    WebImage(url: URL(string: location.heroPicture))
//                                       .onSuccess { image, data, cacheType in
//
//                                       }
//
//                                       .resizable() // Resizable like
//
//                                       .placeholder(Image(systemName: "photo"))                                       .placeholder {
//                                           Rectangle().foregroundColor(.gray)
//                                       }
//                                       .indicator(.activity) // Activity Indicator
//                                       .transition(.fade(duration: 0.5)) // Fade Transition with duration
//
//                                       .frame(width: 80, height: 45, alignment: .center)
//                                        .clipShape(
//                                        RoundedRectangle(cornerRadius: 8))
//                                        .scaledToFit()
//
//                                }
//
//                            }
//
//                        }
//                       // .resizable()
//                        .scaledToFit()
                        WorldView()
                            .scaledToFit()
                           
                           
                        
                       
                }
//                .navigationTitle("More Info")
                    
            }
              
            
//            .sheet(isPresented: $sheet, content: {
//
//                ShareSheet(items:items)
//
//            })
        
        
            
        }
    
    
}







//Share sheet

struct ShareSheet : UIViewControllerRepresentable {
    
    //the data needed to share
   
    
    var items : [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController{
    
        
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context){
        
    }
}

struct ActivityViewController: UIViewControllerRepresentable {

    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(location: Location.example)
        }
    }
}
