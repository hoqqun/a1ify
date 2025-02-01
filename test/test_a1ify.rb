# frozen_string_literal: true

require_relative "test_helper"

class A1ifyTest < Minitest::Test
  # Basic single reference
  def test_single_reference
    assert_equal "C3", A1ify::Converter.rc_to_a(3, 3), "Row 3, Col 3 should convert to 'C3'"
    assert_equal "A1", A1ify::Converter.rc_to_a(1, 1), "Row 1, Col 1 should convert to 'A1'"
  end

  # Multiple references
  def test_multiple_references
    result = A1ify::Converter.rc_to_a([1, 2], [1, 2])
    assert_equal %w[A1 A2 B1 B2], result
  end

  # Mid-range checks (e.g., Row 50, Col 28 => 'AB50')
  def test_mid_range
    assert_equal "AB50", A1ify::Converter.rc_to_a(50, 28), "Row 50, Col 28 should convert to 'AB50'"
    # Another typical mid-range column test (e.g., Col 27 => 'AA')
    assert_equal "AA100", A1ify::Converter.rc_to_a(100, 27), "Row 100, Col 27 should convert to 'AA100'"
  end

  # Boundary cases
  # Excel 2007+ supports up to Row = 1,048,576, Col = 16,384 (XFD)
  def test_boundaries
    # Top-left cell
    assert_equal "A1", A1ify::Converter.rc_to_a(1, 1), "Row 1, Col 1 => 'A1'"

    # Top-right cell (row 1, col 16384 => 'XFD1')
    assert_equal "XFD1", A1ify::Converter.rc_to_a(1, 16_384), "Row 1, Col 16384 => 'XFD1'"

    # Bottom-left cell (row 1048576, col 1 => 'A1048576')
    assert_equal "A1048576", A1ify::Converter.rc_to_a(1_048_576, 1), "Row 1048576, Col 1 => 'A1048576'"

    # Bottom-right cell (row 1048576, col 16384 => 'XFD1048576')
    assert_equal "XFD1048576", A1ify::Converter.rc_to_a(1_048_576, 16_384), "Row 1048576, Col 16384 => 'XFD1048576'"
  end

  # Test array conversion with boundary values
  def test_array_boundaries
    result = A1ify::Converter.rc_to_a([1, 1_048_576], [1, 16_384])
    # Should return ["A1", "A1048576", "XFD1", "XFD1048576"] in alphabetical order by column
    expected = %w[A1 A1048576 XFD1 XFD1048576]
    assert_equal expected, result
  end
end
