//
//  DBConstants.swift
//
//
//  Created by Yash Shah on 15/11/2023.
//

import Vapor
import FluentPostgresDriver

enum DBConstants {
    static var hostname: String {
        Environment.get("DATABASE_HOST") ?? "localhost"
    }
    
    static var port: Int {
        Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? SQLPostgresConfiguration.ianaPortNumber
    }
    
    static var username: String {
        Environment.get("DATABASE_USERNAME") ?? "vapor_username"
    }
    
    static var password: String {
        Environment.get("DATABASE_PASSWORD") ?? "vapor_password"
    }
    
    static var database: String {
        Environment.get("DATABASE_NAME") ?? "vapor_database"
    }
}

