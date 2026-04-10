# Literature Notes (LaTeX Book)

This repository is set up as a LaTeX `book` for long-form literature notes.

## Structure

- `main.tex`: master document
- `projects/`: one `.tex` file per project
- `papers/`: one `.tex` file per paper
- `references.bib`: Zotero auto-exported bibliography

## Build

If you have `latexmk` installed:

```bash
make pdf
```

This compiles `main.tex` into `main.pdf`.

## Add a New Project

1. Add one file for the project:

   ```bash
   touch projects/<project-name>.tex
   ```

2. Put your project note content inside that file, starting with:

   ```tex
   \project{Your Project Title}
   ```

3. Add an input line to `projects/includes.tex`:

   ```tex
   \input{projects/<project-name>}
   ```

4. Re-run:

   ```bash
   make pdf
   ```

   Projects are manually listed in `projects/includes.tex`.

## Add a New Paper

1. Add your paper note file:

   ```bash
   touch papers/<paper-slug>.tex
   ```

2. Edit the new file and add your paper heading + notes, starting with:

   ```tex
   \section{Your Paper Title}
   ```

   Then cite Zotero entries with keys from `references.bib`, e.g. `\parencite{samuel2025cie}` or `\textcite{samuel2025cie}`.
3. Re-run:

   ```bash
   make pdf
   ```

   The build auto-discovers all `papers/*.tex` files.

## Zotero Autolink Setup

1. Install Better BibTeX in Zotero.
2. Export your Zotero collection to `references.bib` using **Better BibTeX**.
3. Enable **Keep updated** in the export dialog.

Now `\parencite{...}` and `\textcite{...}` in your notes auto-link to bibliography entries in the PDF.
