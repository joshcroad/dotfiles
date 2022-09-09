let output = '';

const spotify = Application('Spotify')

const style = {
  playing: '#[fg=#7ea164,bold] ﱘ ',
  paused: '#[fg=#deb66c,bold] ﱙ ',
  stopped: '#[fg=#e06b74,bold] ﱙ '
}

if (spotify.running()) {
  const track = spotify.currentTrack
  const artist = track.artist()
  const title = track.name()

  const state = spotify.playerState()

  output = `${style[state]} ${title.substr(0, 30)} - ${artist.substr(0, 20)}`
} else {
  output = `${style.stopped}`
}

output
