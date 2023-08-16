//
//  DeliveriesWebservice.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import Foundation

class DeliveriesWebservice {

    enum APIError: Error {
        case invalidURL
        case requestFailed(Error?)
        case invalidResponse
    }

    func performRequest(offset: Int, limit: Int = 10) async throws -> Data {
        guard var urlComponents = URLComponents(string: "https://6285f87796bccbf32d6c0e6a.mockapi.io/deliveries") else {
            throw APIError.invalidURL
        }

        urlComponents.queryItems = [
            URLQueryItem(name: "offset", value: "\(offset)"),
            URLQueryItem(name: "limit", value: "\(limit)")
        ]

        guard let url = urlComponents.url else {
            throw APIError.invalidURL
        }

        let session = URLSession.shared

        do {
            let (data, response) = try await session.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw APIError.invalidResponse
            }

            return data
        } catch {
            throw APIError.requestFailed(error)
        }
    }
}
