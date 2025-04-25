//
//  LoginViewModel.swift
//  Reminder
//
//  Created by Saulo Nascimento on 24/04/25.
//

import Firebase

final class LoginViewModel {
    func doLogin(email: String, password: String, _ completion: @escaping (Result<AuthDataResult, any Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          
            if let authResult = authResult {
                completion(.success(authResult))
            } else {
                completion(.failure(error ?? NSError(domain: "Ocorreu um erro ao realizar o login", code: 0, userInfo: nil)))
            }
        }
    }
}
