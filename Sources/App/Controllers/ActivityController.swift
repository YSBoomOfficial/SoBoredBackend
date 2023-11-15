//
//  ActivityController.swift
//
//
//  Created by Yash Shah on 15/11/2023.
//

import Fluent
import Vapor

struct ActivityController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let activity = routes.grouped("activity")
        activity.get(use: getAll)
        activity.post(use: create)
        activity.put(use: update)
        
        activity.group(":id") { activityId in
            activityId.get(use: getOne)
            activityId.delete(use: delete)
        }
    }
    
    // MARK: GET /activity
    func getAll(req: Request) async throws -> [Activity] {
        #warning("TODO: Filter Query using `ActivityQueryParams`")
        return try await Activity.query(on: req.db).all()
    }
    
    // MARK: GET /activity/:id
    func getOne(req: Request) async throws -> Activity {
        #warning("TODO: Filter Query using `ActivityQueryParams`")
        guard let activity = try await Activity.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        return activity
    }
    
    // MARK: POST /activity
    func create(req: Request) async throws -> Activity {
        try Activity.validate(content: req)
        let activity = try req.content.decode(Activity.self)
        try await activity.save(on: req.db)
        return activity
    }
    
    // MARK: PUT /activity
    func update(req: Request) async throws -> HTTPStatus {
        try Activity.validate(content: req)
        
        let updatedActivity = try req.content.decode(Activity.self)
        
        guard let existingActivity = try await Activity.find(updatedActivity.id, on: req.db) else {
            throw Abort(.notFound)
        }
        
        existingActivity.activity = updatedActivity.activity
        existingActivity.type = updatedActivity.type
        existingActivity.participants = updatedActivity.participants
        existingActivity.price = updatedActivity.price
        existingActivity.accessibility = updatedActivity.accessibility
        existingActivity.link = updatedActivity.link
        
        try await existingActivity.delete(on: req.db)
        return .ok
    }
    
    // MARK: DELETE /activity/:id
    func delete(req: Request) async throws -> HTTPStatus {
        guard let activity = try await Activity.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await activity.delete(on: req.db)
        return .ok
    }
}
