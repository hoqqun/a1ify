# A1ify

[日本語版 READMEはこちら](README.ja.md)

A1ify is a Ruby gem that converts Excel R1C1 cell references to the standard A1 format. It supports conversion for both single values and arrays of rows and columns, handling all possible combinations.

## Features

- **Simple Conversion:** Easily convert Excel R1C1 references to A1 format with a straightforward API.
- **Flexible Input:** Accepts both single values and arrays, converting every combination when arrays are provided.

## Installation

### Using RubyGems

```bash
gem install a1ify
```

## Usage  

A1ify provides conversion functionality through the A1ify::Converter class.

### Single Value Conversion

```ruby  
require 'a1ify'

# Convert a single cell reference (e.g., row 3, column 3 converts to "C3")
result = A1ify::Converter.rc_to_a(3, 3)
puts result  # => "C3"
```
### Array Conversion

```ruby  
require 'a1ify'

# Convert multiple cell references by specifying arrays of rows and columns
results = A1ify::Converter.rc_to_a([1, 2], [1, 2])
puts results.inspect  # => ["A1", "A2", "B1", "B2"] (sorted alphabetically by column)
```

## License

A1ify is released under the MIT License.
