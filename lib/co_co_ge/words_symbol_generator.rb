class CoCoGe::WordsSymbolGenerator
  def initialize(corpus:, filter: -> word { true }, post_process: -> word { word.upcase })
    @corpus       = corpus
    @filter       = filter
    @post_process = post_process
  end

  def compute
    words = @corpus.split(/\s+/).map(&@post_process).select(&@filter)
    count = Hash.new(0)
    words.each do |word|
      count[word] += 1
    end
    count.sort_by { |c| -c.last }.first(255).map(&:first)
  end
end
