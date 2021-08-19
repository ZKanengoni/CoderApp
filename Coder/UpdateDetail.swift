//
//  UpdateDetail.swift
//  Coder
//
//  Created by Zivai Kanengomi on 2021/08/17.
//

import SwiftUI

struct UpdateDetail: View {
    var update: Update = updateData[1]
    
    var body: some View {
        List {
            VStack(spacing: 20) {
                Image(update.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationBarTitle(update.title)
        }
        .listStyle(PlainListStyle())
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
