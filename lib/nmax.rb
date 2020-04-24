# frozen_string_literal: true

require 'nmax/version'

module Nmax
  class NotPositiveIntegerArgumentError < StandardError; end

  def self.find(n)
    raise NotPositiveIntegerArgumentError if !n.is_a?(Integer) || !n.positive?

    numbers = []

    $stdin.each_line do |line|
      line.scan(/\d+/) { |number| numbers << number.to_i }
    end

    numbers.uniq!
    numbers.sort!.reverse!
    numbers[0...n]
  end
end
