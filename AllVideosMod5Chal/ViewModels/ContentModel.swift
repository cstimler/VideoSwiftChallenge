//
//  ContentModel.swift
//  AllVideosMod5Chal
//
//  Created by October2022 on 8/30/23.
//

import Foundation


class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    init() {
        
        getRemoteData()
        
    }
    
    func getRemoteData() {
        
        let urlString = "https://codewithchris.github.io/Module5Challenge/Data.json"
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            
            return
        }
        
        let request = URLRequest(url: url!)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { data, response, error in

            guard error == nil else {
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                
                let modules = try decoder.decode([Module].self, from: data!)
                
                DispatchQueue.main.async {
                    
                    self.modules = modules
                }
                
            }
            catch {
               
                print(error)
            }
        }
        
        dataTask.resume()
    }
    
    
}
