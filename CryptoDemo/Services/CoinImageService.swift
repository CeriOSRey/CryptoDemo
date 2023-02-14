//
//  CoinImageService.swift
//  CryptoDemo
//
//  Created by Rey Cerio on 2023-02-06.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage?
    
    private var imageSubscription: AnyCancellable?
    private var fileManger: LocalFileManager
    private var coin: CoinModel
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel, fileManager: LocalFileManager = LocalFileManager.instance) {
        self.fileManger = fileManager
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManger.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
            print("from File Manager")
        } else {
            downloadCoinImage(urlString: coin.image)
            print("from URL Site")
        }
    }
    
    private func downloadCoinImage(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }

        imageSubscription = NetworkingManager.download(url: url)
            .tryMap{ data -> UIImage? in
                return UIImage(data: data)
            }
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:),
                  receiveValue: { [weak self] returnedImage in
                guard let self = self, let downloadImage = returnedImage else { return }
                self.image = downloadImage
                self.imageSubscription?.cancel()
                self.fileManger.saveImage(image: downloadImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
