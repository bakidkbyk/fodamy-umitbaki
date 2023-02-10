//
//  Segmentio+Extensions .swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 10.02.2023.
//
import Segmentio

public extension SegmentioOptions {
    
    static func segmentioOptionsChanged() -> SegmentioOptions {
        
        let indicatorOptions = SegmentioIndicatorOptions(type: .bottom, ratio: 0.40, height: 3, color: .appRed)
        let horizontalSeperatorOptions = SegmentioHorizontalSeparatorOptions(type: .bottom, height: 0, color: .appWhite)
        let verticalSeparatorOptions = SegmentioVerticalSeparatorOptions(ratio: 1, color: .appZircon)
        
        let segmentStates = SegmentioStates(defaultState: SegmentioState(backgroundColor: .appWhite,
                                                                         titleFont: .font(.nunitoBold, size: .medium),
                                                                         titleTextColor: .appCinder, titleAlpha: 1),
                                            selectedState: SegmentioState(backgroundColor: .appWhite,
                                                                          titleFont: .font(.nunitoBold, size: .medium),
                                                                          titleTextColor: .appRed, titleAlpha: 1),
                                            highlightedState: SegmentioState(backgroundColor: .appWhite,
                                                                              titleFont: .font(.nunitoBold, size: .medium),
                                                                              titleTextColor: .appCinder, titleAlpha: 1))
        
        let  segmentioOptions = SegmentioOptions(backgroundColor: .appWhite,
                                                 segmentPosition: .fixed(maxVisibleItems: 2),
                                                 scrollEnabled: true,
                                                 indicatorOptions: indicatorOptions,
                                                 horizontalSeparatorOptions: horizontalSeperatorOptions,
                                                 verticalSeparatorOptions: verticalSeparatorOptions,
                                                 labelTextAlignment: .center,
                                                 segmentStates:
                                                 segmentStates)
        
        return segmentioOptions
    }
}
