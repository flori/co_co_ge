require 'securerandom'

class CoCoGe::CodeGenerator
  def initialize(symbols:, bits: nil, length: nil, separator: nil, parts_per_word: nil)
    @symbols        = symbols.to_a
    @separator      = separator.to_s
    @parts_per_word = parts_per_word

    !!bits ^ !!length or raise ArgumentError,
      "either bits or length parameter is required"
    if bits
      @bits = bits
      @length = (Math.log(1 << @bits) / Math.log(@symbols.size)).floor
    else
      @length = length
      @bits = (Math.log(@symbols.size ** @length) / Math.log(2)).ceil
    end

    check_arguments
  end

  attr_reader :symbols

  attr_reader :bits

  attr_reader :length

  attr_reader :separator

  attr_reader :parts_per_word

  def capacity
    2 ** bits
  end

  def generate(bytes: generate_bytes)
    parts = symbolize(bytes: bytes)
    if @parts_per_word
      parts = parts.each_slice(@parts_per_word).map { |p| p.join }
    end
    parts.join(@separator)
  end

  def parse(code, pack_format: nil)
    code = code.delete(@separator)
    bytes = []
    loop do
      code.empty? and break
      number = parse_next_symbol(code) or return
      bytes << number
    end
    bytes
  end

  def symbolize(bytes: generate_bytes)
    bytes.map { |b| @symbols[b % @symbols.size] }
  end

  private

  def parse_next_symbol(code)
    symbol = @symbols.each_with_index.map { |s, i|
      code =~ /\A#{s}/
      l = $&&.size.to_i
      l.nonzero? && [ l, i ]
    }.compact.max_by(&:first)
    if symbol
      code[0, symbol.first] = ''
      symbol.last
    end
  end

  def check_arguments
    @symbols.uniq!
    @symbols.size.between?(1, 255) or raise ArgumentError,
      "pass between 1 and 255 symbols, was #{@symbols.size}"
    @symbols.map!(&:to_s)
    !@separator.empty? && @symbols.any? { |s| s.include?(@separator) } and
      raise ArgumentError,
      "separator #{@separator.inspect} is included in symbols"
  end

  def generate_bytes
    SecureRandom.random_bytes(@length).bytes
  end
end
