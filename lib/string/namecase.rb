require "string/namecase/constants"
require "string/namecase/version"
require "active_support/core_ext/string/multibyte"

class String

  # Helper method to properly capitalize names
  def namecase
    String::Namecase.capitalize self
  end

  module Namecase
    def self.capitalize name
      _name = name

      hyphens = []

      while (match = _name.match(HYPHEN)) do
        _start = match.begin(1)
        _end = match.end(1)
        _value = match[1]

        if _start == 0
          _name = _name[_end..-1]
        else
          _name = _name[0..._start] << ' ' << _name[_end..-1]
        end

        hyphens << [_start, _end, _value]
      end

      _name = _name.split.map{ |w|
        w.mb_chars.capitalize.to_str
      }.map{ |w|
        w.gsub(MC) { "Mc#{$1.upcase}" }\
         .gsub(MAC) { "Mac#{$1.upcase}" }\
         .gsub(O_APOSTROPHE) { "O'#{$1.upcase}" }
      }

      _name = _name.join(" ")

      hyphens.reverse.each do |_start, _end, _value|
        if _start == 0
          _name = _value << _name
        else
          _name = _name[0..._start] << _value << (_name[_start+1..-1] || "")
        end
      end

      _name = _name \
        .gsub("Van ", "van ") \
        .gsub("De La ", "de la ") \
        .gsub("De ", "de ") \
        .gsub("Dit ", "dit ")
      _name << " "

      (SURNAMES + SUFFIXES).each do |surname_or_suffix|
        position = _name.downcase.index(surname_or_suffix.downcase)
        if position and surname_suffix_position?(position, _name, surname_or_suffix)
          _name = _name[0...position] << surname_or_suffix << _name[position+surname_or_suffix.length..-1]
        end
      end

      _name[0...-1]
    end
    def self.surname_suffix_position? position, name, surname_or_suffix
      # surname/suffix must be:
      # 1. at start of name or after a space or a -
      #          -and-
      # 2. followed by the end of string or a space or a -
      (
        (position == 0) || \
        (
          position > 0 && (name[position-1] == ' ' || name[position-1] == '-')
        )
      ) && (
        (name.length == position+surname_or_suffix.length) || \
        (name[position+surname_or_suffix.length] == ' ') || (name[position+surname_or_suffix.length] == '-')
      )
    end
  end
end
