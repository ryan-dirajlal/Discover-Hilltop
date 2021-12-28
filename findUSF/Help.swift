//
//  Help.swift
//  
//  Created by Ryan Dirajlal on 4/8/21.
//

import SwiftUI
import AVKit

struct Help: View {

    var body: some View {
      
//            VideoPlayer(player: AVPlayer(url: URL (string: "https://www.facebook.com/108066499194/videos/628335721034367")!))
//                Spacer()
              //ScrollView {
                List{
                    Text("Click Discover to view a list of all current featured buildings! Tap on any building to read more info, or find the building through Hilltop Map.")
                        Text("Hilltop Map allows you to experience an interactive map to learn about the hilltop area and where buildings are located.")
                        Text("Click on any picture in the map to learn more about the facts and history of any building!")
                        Text("To see acknowledgments, please tap on Sources.")
                        Text("Coming Soon: Multiple photos for each image, ability to sort Discover Page by category, ability to share images, and more buildings. Stay tuned for an exciting announcement regarding Discover Hilltop's future!")
                                .foregroundColor(.black)
                    VideoPlayer(player: AVPlayer(url:  URL(string: "https://video.wixstatic.com/video/39063d_f447c0ba6f6948c3a8699494555a75cf/1080p/mp4/file.mp4")!))
                        .frame(height: 400)
                }
                    .navigationTitle("Help")
        
        
        
        
    }
}

