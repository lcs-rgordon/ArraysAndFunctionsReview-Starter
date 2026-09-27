//
//  AddSongView.swift
//  RoadTripPlaylist
//

import SwiftUI

struct AddSongView: View {

    // MARK: - Stored properties

    var viewModel: PlaylistViewModel

    // Closes this sheet
    @Environment(\.dismiss) var dismiss

    // What is typed or chosen for the new song
    @State var title: String = ""
    @State var artist: String = ""
    @State var lengthInSeconds: Int = 180
    @State var beatsPerMinute: Int = 110

    // Where to put the new song in the playlist
    @State var position: Int = 0

    // Shown when the song could not be added
    @State var problemMessage: String = ""

    // MARK: - Computed properties

    var body: some View {
        NavigationStack {
            Form {

                Section("Song") {
                    TextField("Title", text: $title)
                    TextField("Artist", text: $artist)
                    Stepper("Length: \(timeDescription(forSeconds: lengthInSeconds))", value: $lengthInSeconds, in: 30...600, step: 5)
                    Stepper("Beats per minute: \(beatsPerMinute)", value: $beatsPerMinute, in: 40...200)
                }

                // Uses TODO 6
                Section {
                    // The range deliberately allows one index past each end, so you can
                    // check what your function does with an index that is out of range
                    Stepper("Insert at index \(position)", value: $position, in: -1...(viewModel.songs.count + 1))
                } header: {
                    Text("Position")
                } footer: {
                    Text("Index 0 is the top of the playlist. Index \(viewModel.songs.count) is the very end.")
                }

                if problemMessage != "" {
                    Section {
                        Text(problemMessage)
                            .foregroundStyle(.red)
                    }
                }

            }
            .formStyle(.grouped)
            .navigationTitle("Add a Song")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        addSong()
                    }
                    .disabled(title == "" || artist == "")
                }
            }
        }
    }

    // MARK: - Functions

    func addSong() {
        let newSong: Song = Song(
            title: title,
            artist: artist,
            lengthInSeconds: lengthInSeconds,
            beatsPerMinute: beatsPerMinute,
            timesPlayed: 0
        )
        let wasInserted: Bool = viewModel.insertSong(newSong, at: position)
        if wasInserted {
            dismiss()
        } else {
            problemMessage = "The song was not added. Index \(position) is outside the playlist, or insertSong(_:at:) is not finished yet."
        }
    }

}

#Preview {
    AddSongView(viewModel: PlaylistViewModel())
}
