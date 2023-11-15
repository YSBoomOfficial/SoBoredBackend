import Fluent
import Vapor

func routes(_ app: Application) throws {
    // GET /api
    let api = app.grouped("api")
    
    // Path: /api/activity
    try api.register(collection: ActivityController())
    
}
