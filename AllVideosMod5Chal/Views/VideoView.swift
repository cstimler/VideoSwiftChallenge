//
//  VideoView.swift
//  AllVideosMod5Chal
//
//  Created by October2022 on 8/30/23.
//

import SwiftUI
import AVKit

struct VideoView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var title: String?
    var urlString: String?
    
    var body: some View {
        
        VStack {
            
            if urlString != nil {
                
                let url = URL(string: urlString!)
                
                if url != nil {
                    
                    VideoPlayer(player: AVPlayer(url: url!))
                        .cornerRadius(10)
                }
                
               
                
            }
            
        }
        
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
