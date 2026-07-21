# Resume

LaTeX-based resume template with support for multiple customized versions.

## Structure

```
├── main.tex          # Master resume template
├── output/           # Compiled PDFs
└── variants/         # (future) Role-specific versions
```

## Building

### Requirements
- TeX distribution (TeX Live, MiKTeX, etc.)
- VS Code with LaTeX Workshop extension (recommended)

### Compile
```bash
# Using latexmk (recommended)
latexmk -pdf main.tex -outdir=output

# Or using pdflatex
pdflatex -output-directory=output main.tex
```

## Creating Variants

To create role-specific resumes:
1. Create a `variants/` folder
2. Copy and modify `main.tex` for each role (e.g., `variants/swe.tex`, `variants/research.tex`)
3. Or use LaTeX conditionals in `main.tex` to toggle sections

## License

MIT
