//
//  HomeViewModel.swift
//  CryptoDemo
//
//  Created by Rey Cerio on 2023-02-06.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [StatisticModel] = [
        StatisticModel(title: "Title", value: "Value", percentageChange: 1),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value", percentageChange: -7)
    ]
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    private var dataService: CoinDataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
//        dataService.$allCoins
//            .sink { [weak self] returnedCoins in
//                print(returnedCoins)
//                self?.allCoins = returnedCoins
//            }
//            .store(in: &cancellables)
        
        // combine with the allCoins and searchText subcribers so any changes to the allCoins or searchText will trigger this subscriber
        // debounce handles quick typing by putting a delay on the on the chain based on timer.
        // map the results and filter out if searchText exist
        // sink the final result into allCoins variable
        // store the this subscriber into the cancellables
        
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map (filterCoins)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !searchText.isEmpty else {
            return coins  // if no searchText, return the original CoinModel array
        }
        
        let lowercaseText = searchText.lowercased()
        return coins.filter {
            return $0.name.lowercased().contains(lowercaseText) ||
                $0.symbol.lowercased().contains(lowercaseText) ||
                $0.id.lowercased().contains(lowercaseText)
        }
    }
    
}

