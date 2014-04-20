require "artii"

module Lita
  module Handlers
    class AsciiArt < Handler
      route(/^ascii\s+(.*)/i, :ascii_from_text, command: true, help: {
        'ascii TEXT' => 'Generate ASCII art from TEXT.'})

        @@art = Artii::Base.new :font => 'standard'

      def ascii_from_text(response)
        s = @@art.asciify(response.matches.first)
        puts s
        response.reply s
        #response.reply @@art.asciify(response.matches.first)
      end
    end

    Lita.register_handler(AsciiArt)
  end
end
