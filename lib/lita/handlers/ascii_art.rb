require "artii"

module Lita
  module Handlers
    class AsciiArt < Handler
      route(/^ascii\s+(.*)/i, :ascii_from_text, command: true, help: {
        'ascii TEXT' => 'Generate ASCII art from TEXT.'})
    end

    Lita.register_handler(AsciiArt)
  end
end
