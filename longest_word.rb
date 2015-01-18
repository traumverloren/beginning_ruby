my_array = %w{this is a test of the longest word check}
longest_word = ''
my_array.each do |word|
  if longest_word.length < word.length
    longest_word = word
    puts longest_word
  end
end