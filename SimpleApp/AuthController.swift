//
//  AuthController.swift
//  SimpleApp
//
//  Created by Rostadhi Akbar, M.Pd on 11/02/22.
//

import Foundation
class AuthController {
    let baseURL = URL(string: urlLogin)!
    
    enum AuthControllerError: Error, LocalizedError {
        case loginFailed
        case registerFailed
        case logoutFailed
    }
    
    func submitLogin(loginReq login: [String]) async throws -> String {
        let loginURL = (baseURL.appendingPathComponent("login"))
        
        var request = URLRequest(url: loginURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let loginIdDict = ["login": login]
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(loginIdDict)
        
        request.httpBody = jsonData
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw AuthControllerError.loginFailed }
        
        let decoder = JSONDecoder()
        let loginResponse = try decoder.decode(FirstLayerAuth.self, from: data)
        print("result \(loginResponse)")
        
        return loginResponse.key
    }
}

