
lines = File.readlines("text.txt")
line_count = lines.size
text = lines.join

puts "#{line_count} lines"

total_characters = text.length
puts "#{total_characters} characters"

total_characters_nospaces = text.gsub(/\s+/, '').length
puts "#{total_characters_nospaces} characters (excluding spaces)"

word_count = text.split.length
puts "#{word_count} words"

sentence_count = text.split(/\.|\?|!/).length
puts "#{sentence_count} sentences"

paragraph_count = text.split(/\n\n/).length
puts "#{paragraph_count} paragraphs"

puts "#{word_count/sentence_count} words per sentence (average)"
puts "#{sentence_count/paragraph_count} sentences per paragraph (average)"