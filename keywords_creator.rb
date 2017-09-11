# find keywords in file and print the line.
class KeywordsCreator
  def initialize(argv)
    @file_name = argv[0]
    @key_words = argv[1..-1]
    @target_file = File.open('target_file.txt', 'w')
    print 'file_name: ' + @file_name + "\n"
    key_words_string = ''
    @key_words.each do |key_word|
      key_words_string += key_word
      key_words_string += ', '
    end
    print 'key_words: ' + key_words_string
  end

  def start
    print 'start find keywords.'
    unless File.exist?(@file_name)
      print 'file not exist'
      return
    end

    source_file = File.open(@file_name, 'r')
    source_file.each do |line|
      find_and_write_line(line)
    end

    source_file.close
    @target_file.close
  end

  def find_and_write_line(line)
    @key_words.each do |key_word|
      if line.include?(key_word)
        @target_file.write(line)
        return
      end
    end
  end
end

print ARGV
print "\n"
key_creator = KeywordsCreator.new(ARGV)
key_creator.start
