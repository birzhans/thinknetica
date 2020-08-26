vowels = ['A', 'E', 'I', 'O', 'U']
vowels_and_index = {

}

vowels.each { |vowel|
  vowels_and_index[vowel] = vowel.ord - 65
}

puts vowels_and_index
