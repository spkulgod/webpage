## Personal website

This repository contains the source for my personal website, built as a single-page static site using plain HTML and CSS.

## Structure

- **index.html**: Main page with sections for experience, education, skills, research, patents, achievements, and contact.
- **styles.css**: Styling for layout, colors, typography, and company logo badges.

The work experience cards include logo badges that pull company logos from Clearbit based on company domains.

## Adding your photo

- Add a square-ish photo named `profile.jpg` at the repository root.
- Replace the placeholder inside the `hero-photo` element in `index.html` with an `<img src="profile.jpg" alt="Portrait of Sutej Pramod Kulgod" />` tag if you want the image rendered instead of the text placeholder.

## Running locally

You can simply open `index.html` in a browser, or serve the folder with any static HTTP server (for example, `python -m http.server` from this directory).

## Deploying with GitHub Pages

1. Push this repository to GitHub.
2. In the repository’s Settings → Pages, select the branch that contains this code and the root (`/`) as the source.
3. Save; GitHub will build and host the site at the URL it shows (for a user site this is typically `https://<username>.github.io/`).
