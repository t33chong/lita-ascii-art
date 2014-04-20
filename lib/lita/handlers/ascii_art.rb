require "artii"

module Lita
  module Handlers
    class AsciiArt < Handler
      route(/^ascii\s+(.*)/i, :ascii_from_text, command: true, help: {
        'ascii TEXT' => 'Generate ASCII art from TEXT.'})

        @@art = Artii::Base.new :font => 'big'

      def ascii_from_text(response)
        response.matches.first.each do |c|
          puts c
        end
        puts response.matches.first
        puts @@art.asciify(response.matches.first)
        puts %Q[#{@@art.asciify(response.matches.first)}]
        response.reply @@art.asciify(response.matches.first)
      end
    end

    Lita.register_handler(AsciiArt)
  end
end
