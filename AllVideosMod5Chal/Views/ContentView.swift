//
//  ContentView.swift
//  AllVideosMod5Chal
//
//  Created by October2022 on 8/30/23.
//
// resume search bar: https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-a-search-bar-to-filter-your-data

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
                            
                            if titleSearch(module.title) == ""
                            { }
                            else
                            {
                                
                                Divider()
                                 NavigationLink(destination: VideoView(title: module.title, urlString: module.url)
                                     .onDisappear(perform:
                                             {
                                 scrollViewID = UUID()
                                 }), label: {
                                     Text(titleSearch(module.title))
                                         .multilineTextAlignment(.leading)
                                         .padding()
                                 })
                                 .accentColor(.black)
                                
                            }
                            
                          
                            
                            
                            
                        }
                        
                    }
                    
                }
             //   .id(self.scrollViewID)
                
            }
            .navigationTitle("All Videos")
        }
        .navigationViewStyle(.stack)
        .searchable(text: $searchText)
        .autocapitalization(.none)
        .id(self.scrollViewID)
    }
    
    func titleSearch(_ temp:String) -> String {
        
        if temp.contains($searchText.wrappedValue) || $searchText.wrappedValue == "" {
            
            return temp
        } else {
            return ""
        }
        }
        
        
    }
   




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ContentModel())
    }
}
