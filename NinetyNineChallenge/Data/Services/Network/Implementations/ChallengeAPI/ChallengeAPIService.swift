//
//  ChallengeAPIService.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

final class ChallengeAPIService {
    private var requestEngine: RequestEngineProtocol
    private var requestBuilder: RequestBuilderProtocol
    
    init(requestEngine: RequestEngineProtocol = URLSessionRequestEngineImpl(),
         requestBuilder: RequestBuilderProtocol = RequestBuilderImpl(urlBase: ChallengeAPICredentials().urlBase)) {
        self.requestEngine = requestEngine
        self.requestBuilder = requestBuilder
    }
    
    func fetchFavoriteStocksList(_ completion: @escaping (Result<FavoriteListDTO, NNError>) -> Void) {
        do {
            let request = try requestBuilder
                .setEndpoint(ChallengeAPIEndpoint.favoriteStocksList)
                .build()
            requestEngine.execute(request,
                                  for: FavoriteListDTO.self, completion)
            
        } catch let error as NNError {
            completion(.failure(error))
        } catch {
            completion(.failure(NNError.unknown(error)))
        }
    }
    
    func fetchfavoriteStockDetail(withIdentifier identifier: String,
                                  _ completion: @escaping (Result<StockDTO, NNError>) -> Void) {
        do {
            let request = try requestBuilder
                .setEndpoint(ChallengeAPIEndpoint.favoriteStockDetail(identifier: identifier))
                .build()
            requestEngine.execute(request,
                                  for: StockDTO.self, completion)
        } catch let error as NNError {
            completion(.failure(error))
        }
        catch {
            completion(.failure(NNError.unknown(error)))
        }
    }
}
