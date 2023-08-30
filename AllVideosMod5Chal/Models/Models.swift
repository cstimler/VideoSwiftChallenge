//
//  Models.swift
//  AllVideosMod5Chal
//
//  Created by October2022 on 8/30/23.
//

import Foundation

struct Module: Decodable, Identifiable {
    
    var id: Int
    var title: String
    var url: String
}
