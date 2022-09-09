let output = '';

const spotify = Application('Spotify')

const colors = {
  playing: '#[fg=#b3e1a3]',
  paused: '#[fg=#777777]',
  stopped: '#[fg=#e28c8c]'
}

if (spotify.running()) {
  const track = spotify.currentTrack
  const artist = track.artist()
  const title = track.name()

  const color = colors[spotify.playerState()]

  output = `${color}ﱘ  ${title.substr(0, 30)} - ${artist.substr(0, 20)}`
} else {
  output = `${colors.stopped}ﱘ Spotify not running`
}

output
