# Resume

LaTeX-based resume with a reusable template class.

## Structure

```
├── resume.cls                    # Template class (DO NOT EDIT for content changes)
├── resume.tex                    # Neutral master resume (EDIT THIS)
├── template.tex                  # Original combined file (reference/backup)
├── variants/                     # Role-tailored versions
│   ├── process-engineer.tex      # Industry R&D / Process Engineer flavor
│   └── data-scientist.tex        # Data Science / ML flavor
└── output/                       # Compiled PDFs (aux files auto-cleaned)
```

## How It Works

- **`resume.cls`** — Contains all packages, commands, and styling (the template)
- **`resume.tex`** — Contains your resume content (what you edit)

This separation means:
- Editing `resume.tex` **never changes** the template
- You can create multiple versions (e.g., `variants/swe.tex`) that all use `resume.cls`

## Building

### Requirements
- TeX distribution (TeX Live, MiKTeX, etc.)
- VS Code with LaTeX Workshop extension (recommended)

### Compile
```bash
# Using latexmk (recommended)
latexmk -pdf resume.tex -outdir=output

# Or using pdflatex
pdflatex -output-directory=output resume.tex
```

### VS Code
- Press `Ctrl+Alt+B` to build
- Press `Ctrl+Alt+V` to view PDF

## Variants

Role-tailored resumes live in `variants/` and all share `resume.cls`:

```bash
latexmk -pdf variants/process-engineer.tex -outdir=output
latexmk -pdf variants/data-scientist.tex  -outdir=output
```

To add a new variant, copy an existing one and edit it.

## Placeholder Metrics

Numbers wrapped in `\tmp{...}` are **placeholder metrics** and render **underlined**
in the PDF so they are easy to spot. Replace them with your real figures, e.g.:

```latex
raising yield by \tmp{12\%}   % <- underlined placeholder, edit before sending
```

## License

MIT
