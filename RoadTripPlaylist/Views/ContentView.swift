//
//  ContentView.swift
//  RoadTripPlaylist
//

import SwiftUI

struct ContentView: View {

    // MARK: - Stored properties

    // The view model is created once, here, and shared with both tabs
    @State var viewModel: PlaylistViewModel = PlaylistViewModel()

    // MARK: - Computed properties

    var body: some View {
        TabView {
            PlaylistView(viewModel: viewModel)
                .tabItem {
                    Label("Playlist", systemImage: "music.note.list")
                }

            FindSongsView(viewModel: viewModel)
                .tabItem {
                    Label("Find Songs", systemImage: "magnifyingglass")
                }
        }
    }

}

#Preview {
    ContentView()
}
