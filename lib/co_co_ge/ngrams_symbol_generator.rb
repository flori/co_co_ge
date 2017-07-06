class CoCoGe::NgramsSymbolGenerator
  def initialize(corpus:, length:, filter: -> word { true }, post_process: -> word { word.upcase })
    @corpus       = corpus
    @filter       = filter
    @length       = length
    @post_process = post_process
  end

  def compute
    words = @corpus.split(/\s+/).select(&@filter).map(&@post_process)
    count = Hash.new(0)
    words.each do |word|
      word.each_char.each_cons(@length) do |part|
        part.size < @length and break
        count[part.join] += 1
      end
    end
    count.sort_by { |c| -c.last }.first(255).map(&:first)
  end
end
