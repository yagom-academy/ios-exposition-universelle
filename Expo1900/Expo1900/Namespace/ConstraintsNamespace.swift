//
//  ConstraintsNamespace.swift
//  Expo1900
//
//  Created by Max, Whales on 2023/07/03.
//

import Foundation

enum ConstraintsNamespace {
    static let stackViewFromScrollViewTop: CGFloat = 20
    static let stackViewFromScrollViewBottom: CGFloat = -20
    static let stackViewFromScrollViewWidth: CGFloat = -40
    
    static let imageViewFromCellLeft: CGFloat = 14
    static let cellSpacingBetweenLabelAndImage: CGFloat = 8
    static let stackViewFromCellWidth = -(imageViewFromCellLeft + cellSpacingBetweenLabelAndImage)
    
    static let imageViewFromCellTop: CGFloat = 10
    static let imageViewFromCellBottom: CGFloat = -10
    static let stackViewFromCellTop: CGFloat = 10
    static let stackViewFromCellBottom: CGFloat = -10
}
