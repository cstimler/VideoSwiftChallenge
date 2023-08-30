//
//  ContentView.swift
//  AllVideosMod5Chal
//
//  Created by October2022 on 8/30/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scrollViewID = UUID()
    @State private var searchText = ""
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
       
        
        NavigationView {
            
            VStack (alignment: .leading) {
                
                ScrollView {
                    
                    LazyVStack (alignment: .leading) {
                        
                        ForEach(model.modules) {module in
                           Divider()
                            NavigationLink(destination: VideoView(title: module.title, urlString: module.url)
                                .onDisappear(perform:
                                        {
                            scrollViewID = UUID()
                            }), label: {
                                Text(module.title)
                                    .multilineTextAlignment(.leading)
                                    .padding()
                            })
                            .accentColor(.black)
                            
                            
                            
                        }
                        
                    }
                    
                }
             //   .id(self.scrollViewID)
                
            }
            .navigationTitle("All Videos")
        }
        .navigationViewStyle(.stack)
        .searchable(text: $searchText)
        .id(self.scrollViewID)
    }
   
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ContentModel())
    }
}
