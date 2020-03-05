//
//  GroupItem.swift
//  lottie-swift
//
//  Created by Brandon Withrow on 1/8/19.
//

import Foundation

/// An item that define an ellipse shape
public class Group: ShapeItem {
  
  /// A list of shape items.
  public let items: [ShapeItem]
  
  private enum CodingKeys : String, CodingKey {
    case items = "it"
  }
  
  public required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: Group.CodingKeys.self)
    self.items = try container.decode([ShapeItem].self, ofFamily: ShapeType.self, forKey: .items)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    try super.encode(to: encoder)
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(items, forKey: .items)
  }

}
