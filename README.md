# Resume

LaTeX-based resume with a reusable template class.

## Structure

```
├── resume.cls          # Template class (DO NOT EDIT for content changes)
├── resume.tex          # Your actual resume (EDIT THIS)
├── template.tex        # Original combined file (reference/backup)
├── output/             # Compiled PDFs (aux files auto-cleaned)
└── variants/           # (future) Role-specific versions
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

## Creating Variants

To create role-specific resumes:
1. Create a `variants/` folder
2. Copy `resume.tex` → `variants/swe.tex`
3. Edit for the specific role
4. Build: `latexmk -pdf variants/swe.tex -outdir=output`

All variants will use the same `resume.cls` template.

## License

MIT
