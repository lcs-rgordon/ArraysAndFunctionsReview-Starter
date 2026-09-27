//
//  PlaylistViewModel.swift
//  RoadTripPlaylist
//

import Foundation
import Observation

// VIEW MODEL
@Observable
class PlaylistViewModel {

    // MARK: - Stored properties

    // The list (array) that the whole app is built around
    var songs: [Song]

    // MARK: - Computed properties

    // Each artist's name, once, in the order they first appear in the playlist.
    // (This one is already written. Read it: it is a good model for your own loops.)
    var artistNames: [String] {
        var names: [String] = []
        for song in songs {
            if names.contains(song.artist) == false {
                names.append(song.artist)
            }
        }
        return names
    }

    // MARK: - Initializer

    init(songs: [Song] = exampleSongs) {
        self.songs = songs
    }

    // MARK: - Functions

    // Finds where a song is in the playlist.
    // Returns its index, or -1 if the song is not in the playlist.
    // (This one is already written. The views use it.)
    func index(of songToFind: Song) -> Int {
        var index: Int = 0
        for song in songs {
            if song.id == songToFind.id {
                return index
            }
            index += 1
        }
        return -1
    }

    // TODO 1: totalLengthInSeconds()
    //
    // Return the length of the whole playlist, in seconds:
    // the lengths of all the songs added together.
    // An empty playlist has a total length of 0.
    func totalLengthInSeconds() -> Int {
        // Replace this placeholder with your own code
        return 0
    }

    // TODO 2: countSongs(by:)
    //
    // Return how many songs in the playlist are by the given artist.
    // The artist's name must match exactly ("Lake Effect" is not "lake effect").
    // If no songs are by that artist, return 0.
    func countSongs(by artist: String) -> Int {
        // Replace this placeholder with your own code
        return 0
    }

    // TODO 3: longestSongTitle()
    //
    // Return the title of the longest song in the playlist.
    // If two or more songs share the longest length, return the one that comes first.
    // If the playlist is empty, return "No songs yet".
    func longestSongTitle() -> String {
        // Replace this placeholder with your own code
        return ""
    }

    // TODO 4: energyLabel(for:)
    //
    // Return a one-word label that describes a song's energy:
    //   - A song at 120 beats per minute or faster is either:
    //       - "Sprint" if it is shorter than 180 seconds, or
    //       - "Dance" if it is 180 seconds or longer.
    //   - A song slower than 120 beats per minute is either:
    //       - "Cruise" if it is at 90 beats per minute or faster, or
    //       - "Chill" if it is slower than 90 beats per minute.
    func energyLabel(for song: Song) -> String {
        // Replace this placeholder with your own code
        return ""
    }

    // TODO 5: keepSongs(by:shorterThan:)
    //
    // Return a NEW list of the songs that are by the given artist
    // AND are shorter than the given number of seconds.
    // A song that is exactly that length is NOT kept.
    // Keep the songs in the same order as the playlist.
    // Do not change the playlist itself.
    func keepSongs(by artist: String, shorterThan maximumSeconds: Int) -> [Song] {
        // Replace this placeholder with your own code
        return []
    }

    // TODO 6: insertSong(_:at:)
    //
    // Insert a new song into the playlist at the given index, then return true.
    // Index 0 puts the song at the top. An index equal to the number of songs
    // puts it at the very end.
    // Any other index (less than 0, or more than the number of songs) is out of range:
    // do not change the playlist, and return false.
    func insertSong(_ newSong: Song, at position: Int) -> Bool {
        // Replace this placeholder with your own code
        return false
    }

    // TODO 7: markAsPlayed(at:)
    //
    // The song at the given index has just been played:
    // add 1 to its timesPlayed, then return true.
    // If the index is out of range (less than 0, or not less than the number of songs),
    // do not change anything, and return false.
    func markAsPlayed(at index: Int) -> Bool {
        // Replace this placeholder with your own code
        return false
    }

    // TODO 8: trimToFit(minutes:)
    //
    // The drive is only so many minutes long. Remove songs from the END of the playlist,
    // one at a time, until the whole playlist is no longer than the drive,
    // or until the playlist is empty.
    // A playlist that is exactly as long as the drive already fits.
    // Return how many songs were removed.
    // Use a while loop. Your function from TODO 1 will help.
    func trimToFit(minutes: Int) -> Int {
        // Replace this placeholder with your own code
        return 0
    }

}
