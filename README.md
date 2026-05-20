# Mojo Trio — Practice Site

Practice site for Mojo Trio (Don Strong, Vicki, John Cello). Static HTML, no build step, hosted on GitHub Pages at [mojotrio.learndoteach.org](https://mojotrio.learndoteach.org).

## What it does
- **Landing page** — lists pieces grouped by concert/set
- **Song pages** — YouTube embed with loop controls and adjustable speed for working on specific passages
- **Virtual concert** — plays all pieces in order on loop
- **Drone** — sustained cello tone for tuning / practice

## Files
| File | Purpose |
|---|---|
| `index.html` + `index.css` | Landing page + shared styles |
| `song.html` | Song practice page (loop controls, speed, YouTube) |
| `concert.html` | Virtual concert (plays all songs in order on loop) |
| `drone.html` | Sustained drone tone tool |
| `songs.json` | Song data, concert metadata, loop times |
| `CNAME` | GitHub Pages custom domain |

## Adding a song
Edit `songs.json`. Example:
```json
{
  "concerts": {
    "summer-set": { "name": "summer set", "date": "july 2026" }
  },
  "songs": {
    "artist-track-name": {
      "title": "artist name — track title",
      "videoId": "YOUTUBE_VIDEO_ID",
      "concert": "summer-set",
      "order": 1,
      "concertStart": "0:10",
      "concertEnd": "3:45",
      "loops": [
        { "start": "0:10", "end": "0:42", "label": "intro" },
        { "start": "0:42", "end": "1:30", "label": "verse 1" }
      ]
    }
  }
}
```

- `title` — uses ` — ` (space, em-dash, space) to split artist from track name
- `videoId` — the bit after `v=` in a YouTube URL
- `concert` — references a key in `concerts`
- `order` — playback order inside the concert
- `concertStart` / `concertEnd` — optional bounds used by the virtual concert
- `loops` — list of practice sections; `label` is optional

## Develop
Just open `index.html`. For `fetch()` to work locally:
```sh
python3 -m http.server 8000
# visit http://localhost:8000
```

## Deploy
Push to `main` → GitHub Pages rebuilds automatically.
