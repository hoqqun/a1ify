module A1ify
  class Converter
    # R1C1 → A1変換メソッド（単一値と配列の両方に対応）
    def self.rc_to_a(rows, cols)
      # 単一の値の場合、そのまま変換して返す
      unless rows.is_a?(Array) || cols.is_a?(Array)
        return convert_single_r1c1_to_a1(rows, cols)
      end

      # 配列で渡された場合、すべての組み合わせを処理
      rows = [rows] unless rows.is_a?(Array)
      cols = [cols] unless cols.is_a?(Array)

      # 各 row, col の組み合わせを処理して変換
      results = rows.product(cols).map { |row, col| convert_single_r1c1_to_a1(row, col) }

      # アルファベット順（列優先）でソートして返す
      results.sort
    end

    private

    # 1つの R1C1 を A1形式に変換（再帰処理）
    def self.convert_single_r1c1_to_a1(row, col, col_letter = "")
      return "#{col_letter}#{row}" if col <= 0

      col -= 1
      current_char = (65 + (col % 26)).chr
      convert_single_r1c1_to_a1(row, col / 26, current_char + col_letter)
    end
    private_class_method :convert_single_r1c1_to_a1
  end
end
