//
//  VerticalPagingScrollView.swift
//  SeeReels
//
//  Created by Ryan on 2025-07-06.
//


import SwiftUI

struct VerticalPagingScrollView<Content: View>: View {
    
    @Binding var currentPage: Int
    let pageCount: Int
    let content: (Int) -> Content
    
    @State var scrollOffset: CGFloat = 0
    @State var isProgrammaticScroll = false
    
    let pageHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ScrollViewReader { scrollProxy in
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(0..<pageCount, id: \.self) { index in
                        content(index)
                            .frame(height: pageHeight)
                            .id(index)
                    }
                }
                .overlay{ scrollOffsetReader }
            }
            .coordinateSpace(name: "scroll")
            .scrollTargetBehavior(.paging)
            .ignoresSafeArea()
            .onPreferenceChange(ScrollOffsetKey.self) {
                scrollOffset = $0
                
                guard !isProgrammaticScroll else {
                    let landedPage = Int(round(-scrollOffset / pageHeight))
                    if landedPage == currentPage {
                        isProgrammaticScroll = false
                    }
                    return
                }
                
                let rawPage = -scrollOffset / pageHeight
                let nearest = Int(round(rawPage))
                let delta  = abs(rawPage - CGFloat(nearest))
                if delta < 0.05 && nearest != currentPage {
                    currentPage = min(max(nearest, 0), pageCount - 1)
                }
            }
            .onChange(of: currentPage) { _, page in
                isProgrammaticScroll = true
                withAnimation(.easeOut) {
                    scrollProxy.scrollTo(page, anchor: .top)
                }
            }
        }
    }
    
    var scrollOffsetReader: some View {
        GeometryReader {
            Color.clear.preference(
                key: ScrollOffsetKey.self,
                value: $0.frame(in: .named("scroll")).minY
            )
        }
    }
}

private struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
