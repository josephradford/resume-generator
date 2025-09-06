# Portfolio Generator

Automatically generates Word (DOCX) and PDF versions of your technical portfolio from Markdown.

## How it works

1. Add your portfolio content to `portfolio.md`
2. Push changes to the `main` or `master` branch
3. GitHub Actions automatically converts your Markdown to DOCX and PDF
4. Documents are available as:
   - **Release assets** (permanent downloads)
   - **Workflow artifacts** (30-day retention)

## Features

- ✅ Automatic conversion on push to main/master branch
- ✅ Manual trigger available via GitHub Actions UI
- ✅ Table of contents generation
- ✅ Professional PDF formatting with 1-inch margins
- ✅ Downloadable releases with version tracking
- ✅ Both DOCX and PDF formats

## Setup

1. Clone this repository
2. Replace `portfolio.md` with your portfolio content
3. Push to GitHub - the workflow will automatically run

## File Structure

```
portfolio-generator/
├── .github/
│   └── workflows/
│       └── generate-documents.yml
├── portfolio.md              # Your portfolio content (edit this)
└── README.md                 # This file
```

## Download Your Documents

After pushing changes:

1. Go to the **Releases** section of your repository
2. Download the latest `portfolio.docx` and `portfolio.pdf` files
3. Or check the **Actions** tab for workflow artifacts

## Customization

The workflow uses Pandoc with the following features:
- **DOCX**: Table of contents, standalone document
- **PDF**: XeLaTeX engine, 1-inch margins, table of contents

To customize formatting, edit `.github/workflows/generate-documents.yml`.

## Manual Trigger

You can manually trigger document generation:
1. Go to **Actions** tab
2. Select "Generate Portfolio Documents"
3. Click "Run workflow"