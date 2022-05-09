//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Sarika on 09.05.22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins : [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubscribers()
    }
    
    func addSubscribers(){ //we are subscribing to published allCoins in CoinDataService and we will get update when we have new changes
        dataService.$allCoins
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
}
