//
//  GetBlob.swift
//
//
//  Created by Christopher Jr Riley on 2024-02-10.
//

import Foundation

extension ATProtoKit {
    /// Retrieves a blob from a given record.
    /// - Parameter blobQuery: An object containing the `atDID` and `cidHash` of the blob.
    /// - Returns: A `Result` containing ``UploadBlobOutput`` on success or `Error` on failure.
    public func getBlob(from blobQuery: BlobQuery) async -> Result<UploadBlobOutput, Error> {
        guard let sessionURL = session.pdsURL,
              let requestURL = URL(string: "\(sessionURL)/xrpc/com.atproto.sync.getBlob") else {
            return .failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
        }

        let request = APIClientService.createRequest(forRequest: requestURL, andMethod: .post, acceptValue: "'*/*'")

        do {
            let response = try await APIClientService.sendRequest(request, withEncodingBody: blobQuery, decodeTo: UploadBlobOutput.self)
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
}