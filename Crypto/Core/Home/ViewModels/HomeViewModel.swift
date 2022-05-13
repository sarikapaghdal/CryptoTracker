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
    @Published var searchText : String = ""
    @Published var statistics: [StatisticModel] = [
        StatisticModel(title: "title", value: "value", percentageChange: 1.2),
        StatisticModel(title: "title", value: "value"),
        StatisticModel(title: "title", value: "value"),
        StatisticModel(title: "title", value: "value", percentageChange: -23)
    ]
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubscribers()
    }
    
    func addSubscribers(){ //we are subscribing to published allCoins in CoinDataService and we will get update when we have new changes
        /* dataService.$allCoins
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)*/
        
        $searchText
            .combineLatest(dataService.$allCoins)
        
            //waiting for 0.5 seconds before executing rest of the code because if user types 10 letters everytime this code will executes but we dont need that
        
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel]
    {
        guard !text.isEmpty else {
            return coins
        }
        let lowercasedText = text.lowercased()
        
        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
    }
}
