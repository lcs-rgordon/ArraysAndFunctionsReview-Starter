//
//  PlaylistView.swift
//  RoadTripPlaylist
//

import SwiftUI

struct PlaylistView: View {

    // MARK: - Stored properties

    var viewModel: PlaylistViewModel

    // Whether the sheet for adding a song is showing
    @State var isAddingSong: Bool = false

    // How long the drive is, in minutes
    @State var driveMinutes: Int = 30

    // What happened the last time the playlist was trimmed
    @State var trimMessage: String = ""

    // MARK: - Computed properties

    var body: some View {
        NavigationStack {
            List {

                Section("Summary") {
                    LabeledContent("Songs", value: "\(viewModel.songs.count)")

                    // Uses TODO 1
                    LabeledContent("Total length", value: timeDescription(forSeconds: viewModel.totalLengthInSeconds()))

                    // Uses TODO 3
                    LabeledContent("Longest song", value: viewModel.longestSongTitle())
                }

                Section("Songs") {
                    ForEach(viewModel.songs) { song in
                        SongRowView(song: song, viewModel: viewModel)
                    }
                }

                // Uses TODO 8
                Section("Trim to fit the drive") {
                    Stepper("Drive: \(driveMinutes) minutes", value: $driveMinutes, in: 0...120, step: 5)

                    Button("Trim to fit") {
                        let songsRemoved: Int = viewModel.trimToFit(minutes: driveMinutes)
                        trimMessage = "Removed \(songsRemoved) songs."
                    }

                    if trimMessage != "" {
                        Text(trimMessage)
                            .foregroundStyle(.secondary)
                    }
                }

            }
            .navigationTitle("Road Trip")
            .toolbar {
                Button {
                    isAddingSong = true
                } label: {
                    Label("Add Song", systemImage: "plus")
                }
            }
            .sheet(isPresented: $isAddingSong) {
                AddSongView(viewModel: viewModel)
                    .frame(minWidth: 420, minHeight: 380)
            }
        }
    }

}

#Preview {
    PlaylistView(viewModel: PlaylistViewModel())
}
