//
//  ContentView.swift
//  HackerNews
//
//  Created by Elena Sadler on 11/18/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                    
                }
                
            }
            
            .navigationBarTitle("hackerNews")
        }
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Structure for post from HackerNews
//Identifiable protocol allows the ability to recognize order of post based off ID





