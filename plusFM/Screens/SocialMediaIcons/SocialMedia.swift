//
//  SocialMedia.swift
//  plusFM
//
//  Created by Michael Hany on 07/12/2023.
//

import SwiftUI

struct SocialMedia: View {
    var body: some View {
        HStack(spacing: 30) {
            //MARK: - Facebook
            Button(action: {
                if let url = URL(string: "https://www.facebook.com/profile.php?id=100086798425727") {
                    UIApplication.shared.open(url)
                }
            }){
                Image("facebook")
                    .frame(width: 32, height: 32)
            }
            
            //MARK: - Instagram
            Button(action: {
                if let url = URL(string: "https://www.instagram.com/plusfmbahrain/") {
                    UIApplication.shared.open(url)
                }
            }){
                Image("instagram")
                    .frame(width: 32, height: 32)
            }
            
            //MARK: - Tiktok
            Button(action: {
                if let url = URL(string: "https://www.tiktok.com/@plusfm892") {
                    UIApplication.shared.open(url)
                }
            }){
                Image("tiktok")
                    .frame(width: 32, height: 32)
            }
        }
    }
}

struct SocialMedia_Previews: PreviewProvider {
    static var previews: some View {
        SocialMedia()
    }
}
