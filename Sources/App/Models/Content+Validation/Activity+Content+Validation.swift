//
//  Activity+Content+Validation.swift
//
//
//  Created by Yash Shah on 15/11/2023.
//

import Vapor

extension Activity: Content, Validatable {
    static func validations(_ validations: inout Validations) {
        validations.add("id", as: String.self, is: .pattern(.uuidRegex))
        validations.add("activity", as: String.self, is: !.empty)
        validations.add("type", as: String.self, is: !.empty)
        validations.add("participants", as: Int.self, is: .range(0...))
        validations.add("price", as: Double.self, is: .range(0...1))
        validations.add("accessibility", as: Double.self, is: .range(0...1))
        validations.add("link", as: String?.self, is: .nil || .url)
    }
}
