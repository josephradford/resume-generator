#!/bin/bash

set -e

echo "🚀 Starting document generation from all Markdown files..."

# Find all .md files in the workspace
md_files=$(find /workspace -name "*.md" -type f)

if [ -z "$md_files" ]; then
    echo "❌ Error: No .md files found in /workspace/"
    exit 1
fi

echo "📝 Found Markdown files:"
echo "$md_files"
echo ""

# Process each .md file
for md_file in $md_files; do
    # Get the filename without extension
    basename=$(basename "$md_file" .md)
    dirname=$(dirname "$md_file")
    
    echo "🔄 Processing: $md_file"
    
    # Convert to DOCX
    echo "📄 Converting to DOCX..."
    pandoc "$md_file" \
        --from markdown \
        --to docx \
        --output "$dirname/$basename.docx" \
        --standalone \
        --variable papersize=a4
    
    if [ $? -eq 0 ]; then
        echo "✅ DOCX generated: $dirname/$basename.docx"
    else
        echo "❌ DOCX generation failed for $md_file"
        exit 1
    fi
    
    # Convert to PDF with compact formatting
    echo "📑 Converting to PDF..."
    pandoc "$md_file" \
        --from markdown \
        --to pdf \
        --output "$dirname/$basename.pdf" \
        --pdf-engine=xelatex \
        --standalone \
        --variable papersize=a4 \
        --variable geometry:margin=0.6in \
        --variable fontsize=10pt \
        --variable linestretch=1.0 \
        --variable parskip=0.0em \
        --variable parindent=0pt \
        --variable pagestyle=empty
    
    if [ $? -eq 0 ]; then
        echo "✅ PDF generated: $dirname/$basename.pdf"
    else
        echo "❌ PDF generation failed for $md_file"
        exit 1
    fi
    
    echo ""
done

echo "🎉 All documents generated successfully!"
echo "📁 Generated files:"
find /workspace -name "*.docx" -o -name "*.pdf" | sort