import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor

public func configure(_ app: Application) async throws {
    // MARK: DB Config
    let postgresConfig = SQLPostgresConfiguration(
        hostname: DBConstants.hostname,
        port: DBConstants.port,
        username: DBConstants.username,
        password: DBConstants.password,
        database: DBConstants.database,
        tls: .prefer(try .init(configuration: .clientDefault))
    )
    
    app.databases.use(
        DatabaseConfigurationFactory.postgres(configuration: postgresConfig),
        as: .psql
    )
    
    // MARK: Migrations
    app.migrations.add(CreateActivity())
    
    // run migrations
    try await app.autoMigrate()
//    
    // MARK: Routes
    try routes(app)
}
