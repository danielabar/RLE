# Unlike Python, Ruby doesn't have native tuples.
Tuple = Struct.new(:_1, :_2)

module DataScience
  # RLE (run-length encoding): Encode each character by the number of times it appears consecutively.
  def self.rle(input)
    return [] if input.to_s.empty?

    # Keep track of letters that have been seen for incrementing consecutive counter.
    track = {}

    # Array of results to be returned.
    result = []

    # Initialize based on first character in input string
    previous_letter = input[0]
    track[previous_letter] = Tuple.new(previous_letter, 1)
    result << track[previous_letter]

    # Process input string one characetr at a time, starting from second character
    for i in 1..input.length - 1 do
      current_letter = input[i]

      # If the current letter was just seen in the previous iteration, increment its tracking counter,
      # but do not append anything to results because its already been appended.
      track[previous_letter]._2 += 1 if current_letter == previous_letter

      # Otherwise start tracking a new letter and add it to results
      if current_letter != previous_letter
        track[current_letter] = Tuple.new(current_letter, 1)
        result << track[current_letter]
      end

      # The letter that has just been processed (current) now becomes the previous for next iteration
      previous_letter = current_letter
    end
    result
  end
end
