//
//  ImageLayer.swift
//  lottie-swift
//
//  Created by Brandon Withrow on 1/8/19.
//

import Foundation

/// A layer that holds an image.
public class ImageLayerModel: LayerModel {

  /// The reference ID of the image.
  public let referenceID: String

  private enum CodingKeys: String, CodingKey {
    case referenceID = "refId"
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ImageLayerModel.CodingKeys.self)
    self.referenceID = try container.decode(String.self, forKey: .referenceID)
    try super.init(from: decoder)
  }

  public override func encode(to encoder: Encoder) throws {
    try super.encode(to: encoder)
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(referenceID, forKey: .referenceID)
  }

}
