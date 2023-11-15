//
//  ActivityQueryParams+Content.swift
//
//
//  Created by Yash Shah on 15/11/2023.
//

import Vapor

struct ActivityQueryParams: Content {
    
    var type: String?
    
    var participants: Int?
    
    #warning("TODO: Implement, min & max for `participants`")
    // var minParticipants: Int?
    // var maxParticipants: Int?
    
    var price: Double?
    var minPrice: Double?
    var maxPrice: Double?
    
    var accessibility: Double?
    var minAccessibility: Double?
    var maxAccessibility: Double?
    
    #warning("TODO: Implement, `containsLink`/`hasLink` query param")
    // var containsLink: Bool? = false
    
}
