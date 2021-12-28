//
//  discoverView.swift
//  findUSF
//
//  Created by Ryan Dirajlal on 4/9/21.
//

import SwiftUI
import SDWebImageSwiftUI
@available(iOS 15.0, *)
struct discoverView: View {
    //@State var location: Location
  //   @State var items : [Any] = []
    @ObservedObject var locationVM = LocationViewModel()
        
    @State private var showingSheet = false
    let locations: [Location] = Bundle.main.decode("locations.json")
    @State private var searchText = ""
    
    var body: some View {
       

            NavigationView { List(self.locationVM.list) { location in
                NavigationLink(
                    destination: ContentView(location: location)) {
                        AsyncImage(url: URL(string: "\(location.heroPicture)")) { image in
                            image.resizable()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 71, height: 50)
//                        WebImage(url: URL(string: location.heroPicture))
//
//                        // Supports options and context, like `.delayPlaceholder` to show placeholder only when error
//                            .onSuccess { image, data, cacheType in
//                                // Success
//                                // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
//                            }
//
//                            .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
//
//                            .placeholder(Image(systemName: "photo")) // Placeholder Image
//                        // Supports ViewBuilder as well
//                            .placeholder {
//                                Rectangle().foregroundColor(.gray)
//                            }
//                            .indicator(.activity) // Activity Indicator
//                            .transition(.fade(duration: 0.5)) // Fade Transition with duration
//
//                            .frame(width: 71, height: 50, alignment: .center)
//                            .clipShape(
//                                RoundedRectangle(cornerRadius: 5))
//                            .scaledToFit()
                        
                        
                        VStack(alignment: .leading) {
                            Text(location.name)
                                .font(.headline)
                            Text(location.country)
                            
                        }
                        .padding(11)
                        
                    }
                    
                
            }
            .navigationBarTitle("Discover the Hilltop")
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing)
                {
                    
                    //  HStack{Image(systemName: "arrow.up.arrow.down")
                    Button( action: {
                        self.showingSheet = true
                    })
                    
                    {
                        HStack
                        {
                            Text("Sort")
                            Image(systemName: "arrow.up.arrow.down")
                            
                        }
                    }
                    
                    .actionSheet(isPresented: $showingSheet) {
                        ActionSheet(title: Text("Sort List"), message: Text("Select how you want to sort the list:"), buttons: [
                            .default(Text("Default"), action: locationVM.sortByDefault),
                            .default(Text("Building Name"), action: locationVM.sortByName),
                            .default(Text("Building Category"), action: locationVM.sortByCountry),
                            .cancel()
                        ])
                    }
                }
                ToolbarItemGroup(placement: .navigationBarLeading){
                    
                    
                    Link(destination: URL(string: "https://ryan6140.wixsite.com/hilltophistory/faqs")!)
                    {
                        Image(systemName: "person.crop.circle.badge.questionmark")
                    }
                    
                }
            }
                
            }
            .navigationBarHidden(true)
           
            
    
        
        
}
    
  

}



