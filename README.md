# Road Trip Playlist: Arrays and Functions Review

A small SwiftUI app for planning the music on a road trip. The views are finished. Eight functions in the view model are not: that is your job.

This is practice, not an evaluation. Mr. Gordon recommends doing it **without AI**, including Xcode's predictive code completion, because the list and procedure in your client app must be written without AI.

## Open it

1. Open `RoadTripPlaylist.xcodeproj` in Xcode.
2. At the top of the window, choose **My Mac** as the place to run the app.

## Run it

Press **Command-R**. The app runs, but look closely: the total length says `0:00`, there is no longest song, no energy labels, and the Find Songs tab finds nothing. Try the play button and the **+** button too.

## Run the tests

Press **Command-U**, then open the Test navigator (**Command-6**). Each TODO has its own group of tests, named after it. On the starter, most tests fail. That is expected.

A few tests already pass on the starter, because the placeholder happens to give the right answer for that input (an empty playlist really does have a total length of 0). A passing test does not prove a function is right. That is why each function has several tests.

To run just one group, click the diamond beside it in the Test navigator.

## Where to work

Everything you change is in `RoadTripPlaylist/ViewModel/PlaylistViewModel.swift`. Do not change the tests.

## The order to work in

Work through the TODOs in order. They get harder as you go.

| TODO | Function | Core or extension |
|---|---|---|
| 1 | `totalLengthInSeconds()` | core |
| 2 | `countSongs(by:)` | core |
| 3 | `longestSongTitle()` | core |
| 4 | `energyLabel(for:)` | core |
| 5 | `keepSongs(by:shorterThan:)` | core |
| 6 | `insertSong(_:at:)` | extension |
| 7 | `markAsPlayed(at:)` | extension |
| 8 | `trimToFit(minutes:)` | extension |

For each one:

1. Read the comment above the function. It says exactly what the function must do.
2. Before you type, predict what it should return for one of the test inputs.
3. Replace the placeholder with your own code.
4. Run that TODO's tests. When they all pass, run the app and look for the change on screen.
5. Commit, with a message such as *Finish TODO 3*.

Hints for each TODO are on the course page **Arrays and Functions Review**.
