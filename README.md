# Mojo Trio — Practice Site

Practice site for Mojo Trio (Don Strong, Vicki, John Cello). Static HTML, no build step, hosted on GitHub Pages at [mojotrio.learndoteach.org](https://mojotrio.learndoteach.org).

## What it does
- **Landing page** — lists the songs in the set
- **Song pages** — plays the band's recording with section markers; tap a section to jump there or loop it, plus adjustable speed
- **Virtual concert** — plays the whole set back to back, on loop
- **Drone** — sustained root + fifth tone for tuning / practice

## Files
| File | Purpose |
|---|---|
| `index.html` + `index.css` | Landing page + shared styles |
| `song.html` | Song practice page (audio playback, section loops, speed) |
| `concert.html` | Virtual concert (plays all songs in order, on loop) |
| `drone.html` | Sustained drone tone tool |
| `songs.json` | Song list, audio paths, section markers |
| `audio/*.m4a` | The band's recordings |
| `CNAME` | GitHub Pages custom domain |

## Adding a song
1. Drop the recording in `audio/` (m4a or mp3).
2. Add an entry to `songs.json`:

```json
{
  "concerts": {
    "setlist": { "name": "the set", "date": "" }
  },
  "songs": {
    "song-slug": {
      "title": "song name",
      "audio": "audio/song-slug.m4a",
      "concert": "setlist",
      "order": 1,
      "sections": [
        { "label": "intro",   "start": "0:00" },
        { "label": "verse 1", "start": "0:21" },
        { "label": "chorus",  "start": "1:00" }
      ]
    }
  }
}
```

- `title` — shown on the landing page and song page
- `audio` — path to the recording in `audio/`
- `concert` — references a key in `concerts`
- `order` — order inside the set (also the virtual-concert order)
- `sections` — list of `{ label, start }`. Each section loops from its
  `start` to the next section's `start` (the last one runs to the end of
  the track). `start` is `m:ss`.

## Develop
Just open `index.html`. For `fetch()` to work locally:
```sh
python3 -m http.server 8000
# visit http://localhost:8000
```

## Deploy
Push to `main` → GitHub Pages rebuilds automatically.
