//
//  CoinImageViewModel.swift
//  CryptoDemo
//
//  Created by Rey Cerio on 2023-02-06.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var isLoading: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private var dataService: CoinImageService
    
    init(coin: CoinModel) {
        self.dataService = CoinImageService(coin: coin)
        addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)

    }
}
