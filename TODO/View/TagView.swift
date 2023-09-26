//
//  TagView.swift
//  TODO
//
//  Created by Charles He on 9/25/23.
//

import SwiftUI

struct TagView: View {
    let tag: Tag
    var body: some View {
        HStack(alignment: .center) {
            Circle()
                .fill(tag.theme.mainColor)
                .frame(width: 15, height: 15)
                
            Text(tag.tagName)
        }
        .foregroundColor(.white)
        .padding(5)
        .padding(.horizontal, 4)
        .background(Color.gray)
        .cornerRadius(15)
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        let tagExample = Tag.sampleTags[0]
        TagView(tag: tagExample)
    }
}
