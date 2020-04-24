# frozen_string_literal: true

require 'test_helper'
require 'support/io_test_helper'

class NmaxTest < Minitest::Test
  include IoTestHelper

  def test_that_it_has_a_version_number
    refute_nil ::Nmax::VERSION
  end

  def test_it_returns_n_max_numbers
    input = ['123aaa10aaa', 'aaa 10', 'bbb', '1 2 3 4 5', '1000.11 180']
    expected_result = [1000, 180, 123]

    assert_equal(
      expected_result,
      simulate_stdin(input) { Nmax.find(3) }
    )
  end

  def test_it_raises_error_if_argument_is_not_positive
    invalid_arguments = [nil, -1, 0, '5']

    invalid_arguments.each do |n|
      assert_raises Nmax::NotPositiveIntegerArgumentError do
        Nmax.find(n)
      end
    end
  end
end
