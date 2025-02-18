# generate_tags.rb

require 'fileutils'

# Path to the tags folder
tags_folder = File.join(Dir.pwd, '_tags')
FileUtils.mkdir_p(tags_folder) unless Dir.exist?(tags_folder)

# Load all posts
posts = Dir.glob(File.join(Dir.pwd, '_posts', '**', '*.md')) +
        Dir.glob(File.join(Dir.pwd, '_articles', '**', '*.md')) +
        Dir.glob(File.join(Dir.pwd, '_writeups', '**', '*.md'))

# Extract all unique tags
tags = posts.flat_map do |post|
  content = File.read(post)
  if content.match(/tags:\s*\[(.*)\]/)
    $1.split(',').map(&:strip)
  else
    []
  end
end.uniq

# Generate a Markdown file for each tag
tags.each do |tag|
  tag_file = File.join(tags_folder, "#{tag.downcase.gsub(' ', '-')}.md")
  next if File.exist?(tag_file)

  File.open(tag_file, 'w') do |file|
    file.puts <<~TAG_PAGE
      ---
      layout: tag
      title: "Tag: #{tag}"
      tag: #{tag}
      permalink: /secVlog/tags/#{tag.downcase.gsub(' ', '-')}/
      ---

      {% for post in site.tags.#{tag} %}
      <article class="post">
          <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
          <div class="post-meta">
              <span class="date">{{ post.date | date: "%B %d, %Y" }}</span>
          </div>
      </article>
      {% endfor %}
    TAG_PAGE
  end

  puts "Generated tag page: #{tag_file}"
end