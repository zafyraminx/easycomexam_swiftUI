//
//  DetailsScreen.swift
//  Easycom Japan PH
//
//  Created by Michael Angelo Zafra on 1/16/23.
//

import SwiftUI

struct DetailsScreen: View {
    var detail: Entry?
    
    var body: some View {
        VStack {
            ZStack {
                AsyncImage(url: URL(string: detail?.url ?? "")) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    //put your placeholder here
                }
                .frame(width: 300, height: 300)
                
                //                Text("300 x 300")
                //                    .font(.system(size: 16, weight: .bold))
                //                    .padding()
            }
            
            Text(detail?.title ?? "")
                .padding()
                .foregroundColor(Color.black)
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(" ID: \(detail?.id ?? 0) ")
    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen(detail: nil)
    }
}
