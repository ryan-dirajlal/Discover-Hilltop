////
////  discoverView.swift
////  findUSF
////
////  Created by Ryan Dirajlal on 4/9/21.
////
//
//import SwiftUI
//
//struct HStackView: View {
//    //@State var location: Location
//  //   @State var items : [Any] = []
//    let locations: [Location] = Bundle.main.decode("locations.json")
//
//
//    var body: some View {
//
//        NavigationView { List(locations) { location in
//                NavigationLink(
//                    destination: ContentView(location: location)) {
//                    Image(location.pictures)
//                        .resizable()
//                                        .scaledToFill()
//                                        .frame(width: 50, height: 35)
//                                        .clipShape(
//                                            RoundedRectangle(cornerRadius: 5)
//                                        )
//                                        .overlay(
//                                            RoundedRectangle(cornerRadius: 5)
//                                                .stroke(Color.black, lineWidth: 1)
//                                        )
//
//                    VStack(alignment: .leading) {
//                                    Text(location.name)
//                                        .font(.headline)
//
//                                }
//                }
//            }
//
//
//    }
//        .navigationBarTitle("Discover the Hilltop")
//}
//
//
//}
