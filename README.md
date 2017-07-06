# CoCoGe - Coupon Code Generator

## Description

This library can be used to generate various readable or unreadable coupon
codes.

## Installation

    # gem install co_co_ge

## Usage

    require 'open-uri'
    require 'co_co_ge'

    symbols = CoCoGe::NgramsSymbolGenerator.new(
      corpus: open('http://www.gutenberg.org/cache/epub/10/pg10.txt').read,
      post_process: -> word { word.upcase.delete '^A-Z' },
      length: 3
    ).compute
    g = CoCoGe::CodeGenerator.new(symbols: symbols, length: 6, parts_per_word: 2, separator: ?-)
    g.generate # => "ILLAIN-RTHARD-ORECOR"

## Changes


## Download

The homepage of this library is located at

* https://github.com/flori/co\_co\_ge

## Author

[Florian Frank](mailto:flori@ping.de)

## License

This software is licensed under the Apache 2.0 license.
