require "artii"

module Lita
  module Handlers
    class AsciiArt < Handler
      route(/^ascii\s+(.*)/i, :ascii_from_text, command: true, help: {
        t("help.ascii_key") => t("help.ascii_value")})

        @@art = Artii::Base.new :font => 'standard'

      def ascii_from_text(response)
        s = ''
        response.matches.first.each do |c|
          s += @@art.asciify(c)
        end
        response.reply s
      end
    end

    Lita.register_handler(AsciiArt)
  end
end
