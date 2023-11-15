//
//  CreateActivity.swift
//
//
//  Created by Yash Shah on 15/11/2023.
//

import Fluent

struct CreateActivity: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(Activity.schema)
            .id()
            .field("activity", .string, .required)
            .unique(on: "activity", name: "activity_description_unique_constraint")
            .field("type", .string, .required)
            .field("participants", .int, .required)
            .field("price", .double, .required)
            .field("accessibility", .double, .required)
            .field("link", .string)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema(Activity.schema).delete()
    }
}
