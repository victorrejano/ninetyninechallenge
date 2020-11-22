//
//  URLSessionRequestEngineImpl.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

final class URLSessionRequestEngineImpl: RequestEngineProtocol {
    private var session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func execute<T>(_ request: URLRequest,
                    for type: T.Type,
                    _ completion: @escaping (Result<T, NNError>) -> Void) where T : Decodable {
        session.dataTask(with: request) { data, _, error in
            guard error == nil else {
                return completion(.failure(.network(error!)))
            }
            
            guard let data = data,
                  !data.isEmpty
            else { return completion(.failure(.data(.unableToObtain))) }
            
            do {
                let dataResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(dataResponse))
            } catch {
                completion(.failure(.unknown(error)))
            }
        }.resume()
    }
}
