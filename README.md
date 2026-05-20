# Mojo Trio

Site for Mojo Trio — a backup band for featured local artists. Don Strong (producer / percussion), Vicki (bass / backup vocals), John Cello.

Static HTML, no build step, hosted on GitHub Pages at [mojotrio.learndoteach.org](https://mojotrio.learndoteach.org).

## Files
| File | Purpose |
|---|---|
| `index.html` + `index.css` | Landing page |
| `drone.html` | Sustained cello tone — practice and tuning tool (shares `index.css`) |
| `CNAME` | GitHub Pages custom domain config |

## Develop
Just open `index.html` in a browser. For local fetches if you add any:

```sh
python3 -m http.server 8000
# then visit http://localhost:8000
```

## Deploy
Push to `main` → GitHub Pages rebuilds automatically.
