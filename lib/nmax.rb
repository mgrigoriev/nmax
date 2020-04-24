require "nmax/version"

module Nmax
  class NotPositiveArgumentError < StandardError; end

  def self.find(n)
    raise NotPositiveArgumentError unless n.positive?

    numbers = []

    $stdin.each_line do |line|
      line.scan(/\d+/) { |number| numbers << number.to_i }
    end

    numbers.uniq!
    numbers.sort!.reverse!
    numbers[0...n]
  end
end
