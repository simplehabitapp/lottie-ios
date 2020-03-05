//
//  TextDocument.swift
//  lottie-swift
//
//  Created by Brandon Withrow on 1/9/19.
//

import Foundation

public enum TextJustification: Int, Codable {
  case left
  case right
  case center
}

public final class TextDocument: Codable {
  
  /// The Text
  public let text: String
  
  /// The Font size
  public let fontSize: Double
  
  /// The Font Family
  public let fontFamily: String
  
  /// Justification
  public let justification: TextJustification
  
  /// Tracking
  public let tracking: Int
  
  /// Line Height
  public let lineHeight: Double
  
  /// Baseline
  public let baseline: Double?
  
  /// Fill Color data
  public let fillColorData: Color
  
  /// Scroke Color data
  public let strokeColorData: Color?
  
  /// Stroke Width
  public let strokeWidth: Double?
  
  /// Stroke Over Fill
  public let strokeOverFill: Bool?
  
  private enum CodingKeys : String, CodingKey {
    case text = "t"
    case fontSize = "s"
    case fontFamily = "f"
    case justification = "j"
    case tracking = "tr"
    case lineHeight = "lh"
    case baseline = "ls"
    case fillColorData = "fc"
    case strokeColorData = "sc"
    case strokeWidth = "sw"
    case strokeOverFill = "of"
  }
}
