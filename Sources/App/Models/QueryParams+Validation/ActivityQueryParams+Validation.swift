//
//  ActivityQueryParams+Validation.swift
//  
//
//  Created by Yash Shah on 15/11/2023.
//

import Vapor

extension ActivityQueryParams: Validatable {
    static func validations(_ validations: inout Validations) {
        #warning("TODO: Add Validation for `ActivityQueryParams`")
        // either `price` or `maxPrice` & `minPrice`
        // either `accessibility` or `maxAccessibility` & `minAccessibility`
        // `participants` range 0... (`maxParticipants` & `minParticipants`)
        // `type` !.empty
    }
}
