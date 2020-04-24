require 'nmax/version'

module Nmax
  CHUNK_SIZE_IN_BYTES = 1024
  UNIQALIZATION_FREQUENCY_IN_CHUNKS = 10_000

  class NotPositiveIntegerArgumentError < StandardError; end

  def self.find(n)
    raise NotPositiveIntegerArgumentError unless n.is_a?(Integer) && n.positive?

    numbers = []
    buffer = ''
    chunk = ''
    chunks_counter = 0

    until chunk.nil?
      # Optimize for the scenario when we have a huge string and reading line by line won't work
      chunk = $stdin.read CHUNK_SIZE_IN_BYTES
      chunks_counter += 1

      # Optimize runtime and memory usage
      numbers.uniq! if (chunks_counter % UNIQALIZATION_FREQUENCY_IN_CHUNKS).zero?

      unless chunk.nil?
        buffer << chunk
        next if buffer[-1] =~ /\d/
      end

      buffer.scan(/\d+/) { |number| numbers << number.to_i }
      buffer = ''
    end

    numbers.uniq!
    numbers.sort!.reverse!
    numbers[0...n]
  end
end
