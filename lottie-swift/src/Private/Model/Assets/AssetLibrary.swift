//
//  AssetLibrary.swift
//  lottie-swift
//
//  Created by Brandon Withrow on 1/9/19.
//

import Foundation

public class AssetLibrary: Codable {
  
  /// The Assets
  public let assets: [String : Asset]
  
  public let imageAssets: [String : ImageAsset]
  public let precompAssets: [String : PrecompAsset]
  
  public required init(from decoder: Decoder) throws {
    var container = try decoder.unkeyedContainer()
    var containerForKeys = container
    
    var decodedAssets = [String : Asset]()
    
    var imageAssets = [String : ImageAsset]()
    var precompAssets = [String : PrecompAsset]()
    
    while !container.isAtEnd {
      let keyContainer = try containerForKeys.nestedContainer(keyedBy: PrecompAsset.CodingKeys.self)
      if keyContainer.contains(.layers) {
        let precompAsset = try container.decode(PrecompAsset.self)
        decodedAssets[precompAsset.id] = precompAsset
        precompAssets[precompAsset.id] = precompAsset
      } else {
        let imageAsset = try container.decode(ImageAsset.self)
        decodedAssets[imageAsset.id] = imageAsset
        imageAssets[imageAsset.id] = imageAsset
      }
    }
    self.assets = decodedAssets
    self.precompAssets = precompAssets
    self.imageAssets = imageAssets
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.unkeyedContainer()
    try container.encode(contentsOf: Array(assets.values))
  }
}
