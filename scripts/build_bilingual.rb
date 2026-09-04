#!/usr/bin/env ruby
# frozen_string_literal: true

# build_bilingual.rb
#
# Generates the Korean Jekyll collection (_ko) from the canonical prose under
# books/, and the English stub collection (_en) that mirrors its structure.
#
# Contract:
#   * NEVER modifies books/*.md. The Korean bodies are copied byte-for-byte and
#     YAML front-matter is PREPENDED to the copy written into _ko/.
#   * Idempotent: re-running fully regenerates _ko/ and _en/ from source.
#   * No em dash (U+2014) is introduced anywhere.
#
# The generated _ko/ and _en/ trees are committed to the repo so the Pages
# build is a plain `bundle exec jekyll build` with no pre-step. Re-run this
# script whenever the Korean source prose under books/ changes, then commit the
# regenerated trees.
#
# Usage:  ruby scripts/build_bilingual.rb

require "fileutils"

ROOT     = File.expand_path("..", __dir__)
BOOKS    = File.join(ROOT, "books")
KO_DIR   = File.join(ROOT, "_ko")
EN_DIR   = File.join(ROOT, "_en")

# Slug order and English book titles (see canon glossary / context).
BOOK_TITLES_EN = {
  "01-revelation"     => "Revelation",
  "02-genesis"        => "Genesis",
  "03-exodus"         => "Exodus",
  "04-judges"         => "Judges",
  "05-psalms"         => "Psalms",
  "06-proverbs"       => "Proverbs",
  "07-new-testament"  => "New Testament",
  "08-acrophyia"      => "Acrophyia",
  "09-infancy-gospel" => "Infancy Gospel"
}.freeze

# Quote a value for YAML by wrapping in double quotes and escaping any embedded
# double quote or backslash. Keeps Korean text intact.
def yaml_quote(value)
  escaped = value.to_s.gsub("\\", "\\\\\\\\").gsub('"', '\\"')
  %("#{escaped}")
end

# Pull the first H1 ("# ...") from a markdown body as the display title.
def parse_h1(body)
  body.each_line do |line|
    stripped = line.strip
    return stripped.sub(/\A#\s*/, "") if stripped.start_with?("# ")
  end
  nil
end

def front_matter(fields)
  lines = ["---"]
  fields.each do |key, value|
    formatted =
      case value
      when Integer then value.to_s
      else yaml_quote(value)
      end
    lines << "#{key}: #{formatted}"
  end
  lines << "---"
  lines.join("\n") + "\n"
end

def chapter_num(filename)
  case File.basename(filename)
  when "00-index.md" then 0
  else
    m = filename.match(/chapter-(\d+)\.md\z/)
    m ? m[1].to_i : 0
  end
end

def translation_key(slug, filename)
  base = File.basename(filename, ".md")
  base = "00-index" if base == "00-index"
  "#{slug}/#{base}"
end

def clean_tree(dir)
  FileUtils.rm_rf(dir)
  FileUtils.mkdir_p(dir)
end

abort("books/ not found at #{BOOKS}") unless Dir.exist?(BOOKS)

clean_tree(KO_DIR)
clean_tree(EN_DIR)

slugs = BOOK_TITLES_EN.keys
ko_count = 0
en_count = 0

slugs.each do |slug|
  book_dir = File.join(BOOKS, slug)
  next unless Dir.exist?(book_dir)

  book_num = slug.split("-", 2).first.to_i
  en_title_book = BOOK_TITLES_EN.fetch(slug)

  ko_book_dir = File.join(KO_DIR, slug)
  en_book_dir = File.join(EN_DIR, slug)
  FileUtils.mkdir_p(ko_book_dir)
  FileUtils.mkdir_p(en_book_dir)

  files = Dir.children(book_dir).select { |f| f.end_with?(".md") }.sort

  files.each do |filename|
    src_path = File.join(book_dir, filename)
    body = File.read(src_path, encoding: "UTF-8")

    if body.include?("\u2014")
      abort("Em dash found in source #{src_path}; aborting to keep the rule.")
    end

    chapter = chapter_num(filename)
    key = translation_key(slug, filename)
    ko_title = parse_h1(body) || slug
    layout = chapter.zero? ? "book" : "chapter"

    # --- Korean document: prepend front-matter to the exact original body ---
    ko_fm = front_matter(
      "lang" => "ko",
      "layout" => layout,
      "book" => slug,
      "book_num" => book_num,
      "chapter" => chapter,
      "title" => ko_title,
      "translation_key" => key
    )
    File.write(File.join(ko_book_dir, filename), ko_fm + body, encoding: "UTF-8")
    ko_count += 1

    # --- English stub document: full front-matter, placeholder body ---
    en_title =
      if chapter.zero?
        "Omelas: #{en_title_book}"
      else
        "Chapter #{chapter}"
      end

    en_fm = front_matter(
      "lang" => "en",
      "layout" => layout,
      "book" => slug,
      "book_num" => book_num,
      "chapter" => chapter,
      "title" => en_title,
      "translation_key" => key
    )
    en_placeholder = "<!-- TODO(FEAT-002..004): replace with the faithful English translation. -->\n\nTranslation in progress.\n"
    File.write(File.join(en_book_dir, filename), en_fm + en_placeholder, encoding: "UTF-8")
    en_count += 1
  end
end

puts "Generated #{ko_count} Korean docs into _ko/ and #{en_count} English stub docs into _en/."
