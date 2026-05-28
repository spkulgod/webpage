## Cursor Cloud specific instructions

- This repository is a plain static personal website. There is no package manager, build step, backend, database, or configured test runner.
- Use `README.md` for the standard local run command. Serving with `python -m http.server` is the closest development-mode check for the site.
- Treat Google Fonts, YouTube embeds, Clearbit/logo links, and outbound profile/research links as external network dependencies; the core local page should still render without them.
- For changes to `index.html`, `styles.css`, or media assets, validate with a browser against the local static server and exercise at least one in-page navigation link.
