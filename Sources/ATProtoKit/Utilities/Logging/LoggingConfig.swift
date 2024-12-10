//
//  LoggingConfiguration.swift
//  ATProtoKit
//
//  Created by Martin Lasek on 12/10/24.
//

import Logging

public struct LoggingConfiguration {
    let isLoggingEnabled: Bool

    let logIdentifier: String?
    let logCategory: String?
    let logLevel: Logger.Level?

    public init (
        isLoggingEnabled: Bool = true,
        logIdentifier: String? = nil,
        logCategory: String? = nil,
        logLevel: Logger.Level? = .info
    ) {
        self.isLoggingEnabled = isLoggingEnabled
        self.logIdentifier = logIdentifier
        self.logCategory = logCategory
        self.logLevel = logLevel
    }

    public static func disabled() -> LoggingConfiguration {
        LoggingConfiguration(isLoggingEnabled: false)
    }
}
