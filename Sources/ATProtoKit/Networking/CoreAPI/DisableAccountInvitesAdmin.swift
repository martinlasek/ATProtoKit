//
//  DisableAccountInvitesAsAdmin.swift
//
//
//  Created by Christopher Jr Riley on 2024-02-28.
//

import Foundation

extension ATProtoKit {
    /// Disables a user account's ability to receive future invite codes as an administrator.
    ///  
    /// - Note: According to the AT Protocol specifications: "Disable an account from receiving new invite codes, but does not invalidate existing codes."
    /// 
    /// - Parameters:
    ///   - accountDID: The decentralized identifier (DID) of the user account.
    ///   - note: A note on why the account will lose the ability to get new invite codes.
    public func disableAccountInvitesAsAdmin(_ accountDID: String, note: String?) async throws {
        guard let sessionURL = session.pdsURL,
              let requestURL = URL(string: "\(sessionURL)/xrpc/com.atproto.admin.disableAccountInvites") else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }

        let requestBody = AdminDisableAccountInvites(accountDID: accountDID, note: note)

        do {
            let request = APIClientService.createRequest(forRequest: requestURL, andMethod: .post, acceptValue: nil, contentTypeValue: "application/json", authorizationValue: "Bearer \(session.accessToken)")

            try await APIClientService.sendRequest(request, withEncodingBody: requestBody)
        } catch {
            throw error
        }
    }
}
