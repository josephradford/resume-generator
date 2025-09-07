#!/bin/bash

set -e

echo "🚀 Starting portfolio document generation..."

# Check if portfolio.md exists
if [ ! -f "/workspace/portfolio.md" ]; then
    echo "❌ Error: portfolio.md not found in /workspace/"
    exit 1
fi

# Convert to DOCX
echo "📄 Converting to DOCX..."
pandoc /workspace/portfolio.md \
    --from markdown \
    --to docx \
    --output /workspace/portfolio.docx \
    --standalone

if [ $? -eq 0 ]; then
    echo "✅ DOCX generated successfully"
else
    echo "❌ DOCX generation failed"
    exit 1
fi

# Convert to PDF
echo "📑 Converting to PDF..."
pandoc /workspace/portfolio.md \
    --from markdown \
    --to pdf \
    --output /workspace/portfolio.pdf \
    --pdf-engine=xelatex \
    --standalone \
    --variable geometry:margin=1in

if [ $? -eq 0 ]; then
    echo "✅ PDF generated successfully"
else
    echo "❌ PDF generation failed"
    exit 1
fi

echo "🎉 All documents generated successfully!"
echo "📁 Files created:"
echo "   - portfolio.docx"
echo "   - portfolio.pdf"