//
//  Activity.swift
//
//
//  Created by Yash Shah on 15/11/2023.
//

import Fluent

final class Activity: Model {
    static let schema = "activity"
    
    /// A unique identifier representing the ID
    @ID(key: .id)
    var id: UUID?

    /// Description of the activity
    @Field(key: "activity")
    var activity: String
    
    /// Type of the activity
    @Field(key: "type")
    var type: String
    
    /// The number of people that this activity could involve
    ///
    /// - Range: [0, n]
    @Field(key: "participants")
    var participants: Int
    
    /// A factor describing the cost of the event.
    ///
    /// - Range: [0, 1] with 0 being free and 1 being expensive
    @Field(key: "price")
    var price: Double
    
    /// A factor describing how possible an event is to do.
    ///
    /// - Range: [0.0, 1.0] with zero being the most accessible
    @Field(key: "accessibility")
    var accessibility: Double
    
    /// A link relating to the activity
    @Field(key: "link")
    var link: String?

    init() { }
    
    init(
        id: UUID? = nil,
        activity: String,
        type: String,
        participants: Int,
        price: Double,
        accessibility: Double,
        link: String? = nil
    ) {
        self.id = id
        self.activity = activity
        self.type = type
        self.participants = participants
        self.price = price
        self.link = link
        self.accessibility = accessibility
    }
}
