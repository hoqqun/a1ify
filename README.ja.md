# A1ify

A1ify は、Excel の R1C1 形式のセル参照を標準的な A1 形式に変換する Ruby gem です。  
単一の値だけでなく、行と列の配列にも対応しており、あらゆる組み合わせの変換をサポートします。

## 特徴

- **シンプルな変換:**  
  Excel の R1C1 参照を A1 形式にシンプルな API で簡単に変換できます。
- **柔軟な入力:**  
  単一の値はもちろん、配列での入力も受け付け、すべての組み合わせを変換します。

## インストール

### RubyGems を使用する場合

```bash
gem install a1ify
```

## Usage  

A1ify は、 A1ify::Converter クラスを通じて変換機能を提供します。

### 単一の値の変換

```ruby  
require 'a1ify'

# 例: 行 3、列 3 のセル参照を変換（"C3" となる）
result = A1ify::Converter.rc_to_a(3, 3)
puts result  # => "C3"
```
### 配列での変換

```ruby  
require 'a1ify'


# 例: 行と列の配列を指定して、すべてのセル参照の組み合わせを変換
results = A1ify::Converter.rc_to_a([1, 2], [1, 2])
puts results.inspect  # => ["A1", "A2", "B1", "B2"]（列のアルファベット順にソートされた結果）
```

## License

A1ify は MIT ライセンスの下でリリースされています。
