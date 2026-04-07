# Literature Notes (LaTeX Book)

This repository is set up as a LaTeX `book` for long-form literature notes.

## Structure

- `main.tex`: master document
- `papers/<year>/`: one `.tex` file per paper (each file should define one `\section{...}`)

## Build

If you have `latexmk` installed:

```bash
make pdf
```

This compiles `main.tex` into `main.pdf`.

## Add a New Paper

1. Create a year folder if needed, then add your paper note:

   ```bash
   mkdir -p papers/2025
   touch papers/2025/<paper-slug>.tex
   ```

2. Edit the new file and add your section + notes.
3. Re-run:

   ```bash
   make pdf
   ```

   The build auto-discovers all `papers/<year>/*.tex` files, and creates one chapter per year folder.
