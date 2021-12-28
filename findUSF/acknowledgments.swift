//
//  acknowledgments.swift
//  findUSF
//
//  Created by Ryan Dirajlal on 4/9/21.
//

import SwiftUI
import MessageUI

struct acknowledgments: View {
    @Environment(\.openURL) var openURL
    let emailURL = URL(string: "ryan@dirajlal.com")!
    @State var result: Result<MFMailComposeResult, Error>? = nil
      @State var isShowingMailView = false
    var body: some View {
        ZStack
        {
            VStack{
                ScrollView {
                   
                    HStack{
                    Image("USFAppIcon")
                        .resizable()
                        .frame(width: 95, height: 95)
                        .cornerRadius(18.0)
                        VStack{
                            HStack{
                        Text("Discover Hilltop")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Version 1.3")
                            }
                            Text("By Ryan Dirajlal")
                               
                                
                        }
                        
                    }
                      
                    
                Text("Sources:")
                    .font(.title)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Text("Part of my app includes information readily accessible thanks to the amazing faculty and staff at the Univerisy of San Francisco. The same information can be found at the:")
                    HStack{
                        Image(systemName: "link")
                    Link("University Archives", destination: URL(string: "https://guides.usfca.edu/archives")!)
                        
                    }
                Text("Photographs:")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Text("All photos featured in this app were taken by Ryan Dirajlal in April 2021.")
                    
                    Text("Feedback:")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                    Text("Thanks for trying this app! I'm Ryan and a current Computer Science major at the University of San Francisco. I made this to allow everyone feel closer to the Hilltop, no matter where in the world you may be. For any feedback, please email ryan@dirajlal.com\n")
                    
                    HStack{
                    Image(systemName: "link")
                    Link("Please click here for my Privacy Policy", destination: URL(string: "https://github.com/ryan-dirajlal/findUSF")!).padding()
                        
                    }
                    
                    Text("***Please note, Discover Hilltop is not affiliated with any organization, including the University of San Francisco. This app includes zero content owned by any organization, and all photos are property of Ryan Dirajlal.")
                    
                    
                
                }
//                Button(action: {
//                           self.isShowingMailView.toggle()
//                       }) {
//                           Text("Tap Me")
//                       }
//                       .disabled(!MFMailComposeViewController.canSendMail())
//                       .sheet(isPresented: $isShowingMailView) {
//                           MailView(result: self.$result)
//                       }
//                Button("Send Email"){
//                    openURL(URL(string: "ryan@dirajlal.com")!)
//                }
                
            }
        }
        .navigationTitle("Acknowledgments")
        .padding(.horizontal)
    }
    
}


struct acknowledgments_Previews: PreviewProvider {
    static var previews: some View {
        acknowledgments()
    }
}
