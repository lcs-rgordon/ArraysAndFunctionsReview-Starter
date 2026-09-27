//
//  FindSongsView.swift
//  RoadTripPlaylist
//

import SwiftUI

struct FindSongsView: View {

    // MARK: - Stored properties

    var viewModel: PlaylistViewModel

    // The artist chosen in the picker
    @State var chosenArtist: String = "Lake Effect"

    // Songs must be shorter than this many seconds
    @State var maximumSeconds: Int = 240

    // MARK: - Computed properties

    // Uses TODO 5
    var matchingSongs: [Song] {
        return viewModel.keepSongs(by: chosenArtist, shorterThan: maximumSeconds)
    }

    var body: some View {
        NavigationStack {
            Form {

                Section("Choose") {
                    Picker("Artist", selection: $chosenArtist) {
                        ForEach(viewModel.artistNames, id: \.self) { artistName in
                            Text(artistName)
                                .tag(artistName)
                        }
                    }

                    Stepper("Shorter than \(timeDescription(forSeconds: maximumSeconds))", value: $maximumSeconds, in: 60...420, step: 15)

                    // Uses TODO 2
                    LabeledContent("Songs by this artist", value: "\(viewModel.countSongs(by: chosenArtist))")
                }

                Section("Matching songs") {
                    if matchingSongs.count == 0 {
                        Text("No songs match.")
                            .foregroundStyle(.secondary)
                    } else {
                        ForEach(matchingSongs) { song in
                            LabeledContent(song.title, value: song.lengthDescription)
                        }
                    }
                }

            }
            .formStyle(.grouped)
            .navigationTitle("Find Songs")
        }
    }

}

#Preview {
    FindSongsView(viewModel: PlaylistViewModel())
}
