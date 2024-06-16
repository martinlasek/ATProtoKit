//
//  UnmuteThread.swift
//
//
//  Created by Christopher Jr Riley on 2024-06-16.
//

import Foundation

extension ATProtoKit {

    /// Unmutes a thread.
    /// 
    /// - Note: According to the AT Protocol specifications: ""Unmutes the specified thread.
    /// Requires auth"
    /// 
    /// - SeeAlso: This is based on the [`app.bsky.graph.unmuteThread`][github] lexicon.
    /// 
    /// [github]: https://github.com/bluesky-social/atproto/blob/main/lexicons/app/bsky/graph/unmuteThread.json
    /// 
    /// - Parameter root: The URI of the root of the post.
    public func unmuteThread(_ root: String) async throws {
        guard session != nil,
              let accessToken = session?.accessToken else {
            throw ATRequestPrepareError.missingActiveSession
        }

        guard let sessionURL = session?.pdsURL,
              let requestURL = URL(string: "\(sessionURL)/xrpc/app.bsky.graph.unmuteThread") else {
            throw ATRequestPrepareError.invalidRequestURL
        }

        let requestBody = AppBskyLexicon.Graph.UnmuteThreadRequestBody(
            root: root
        )

        do {
            let request = APIClientService.createRequest(forRequest: requestURL,
                                                         andMethod: .get,
                                                         acceptValue: "application/json",
                                                         contentTypeValue: nil,
                                                         authorizationValue: "Bearer \(accessToken)")

            try await APIClientService.sendRequest(request,
                                                   withEncodingBody: requestBody)
        } catch {
            throw error
        }
    }
}
