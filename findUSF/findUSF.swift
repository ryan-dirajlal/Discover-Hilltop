//

//  
//

import SwiftUI
import SDWebImageSwiftUI 
@main
struct findUSF: App {
    @StateObject var locations = Locations()

    var body: some Scene {
        WindowGroup {
            TabView {
               
                NavigationView {
                    //discoverView(location: locations.primary)
                    discoverView()
                }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Discover")
                }
                

            
                
                NavigationView {
                    WorldView()
                }
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Hilltop Map")
                }
                
                NavigationView {
                    TipsView()
                }
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("FAQs")
                }
                
                
//                 NavigationView{
//                     Help()
//                     
//                 }.tabItem{
//                     Image(systemName: "person.crop.circle.badge.questionmark")
//                     Text("Help")
//                 }
            
               
                
                NavigationView {
                    //Webview(url: URL(string: "https://myusf.usfca.edu")!)
                    acknowledgments()
                }
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Sources")
                }
            }
            .environmentObject(locations)
            //HKHKuju657
            //.tabViewStyle(PageTabViewStyle())
        }
    }
}
