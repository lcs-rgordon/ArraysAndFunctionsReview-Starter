//
//  SongRowView.swift
//  RoadTripPlaylist
//

import SwiftUI

struct SongRowView: View {

    // MARK: - Stored properties

    let song: Song
    var viewModel: PlaylistViewModel

    // Whether to show a message that the song could not be marked as played
    @State var showsPlayProblem: Bool = false

    // MARK: - Computed properties

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(song.title)
                    .font(.headline)

                Text("\(song.artist) · \(song.lengthDescription)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text("Times played: \(song.timesPlayed)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            // Uses TODO 4
            let energyLabel: String = viewModel.energyLabel(for: song)
            if energyLabel != "" {
                Text(energyLabel)
                    .font(.caption.bold())
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.tint.opacity(0.15), in: Capsule())
            }

            // Uses TODO 7
            Button {
                let songIndex: Int = viewModel.index(of: song)
                let wasMarked: Bool = viewModel.markAsPlayed(at: songIndex)
                if wasMarked == false {
                    showsPlayProblem = true
                }
            } label: {
                Image(systemName: "play.circle.fill")
                    .font(.title2)
            }
            .buttonStyle(.borderless)
            .accessibilityLabel("Play \(song.title)")
        }
        .alert("This song could not be marked as played.", isPresented: $showsPlayProblem) {
            Button("OK") { }
        } message: {
            Text("Check markAsPlayed(at:) in the view model.")
        }
    }

}

#Preview {
    List {
        SongRowView(song: exampleSongs[0], viewModel: PlaylistViewModel())
    }
}
