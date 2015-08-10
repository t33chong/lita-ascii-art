require 'artii'

module Lita
  module Handlers
    class AsciiArt < Handler
      route(/^ascii\s+(.*)/i, :ascii_from_text, command: true,
            help: { t('help.ascii_key') => t('help.ascii_value') })

      @@art = Artii::Base.new font: 'standard'

      def ascii_from_text(response)
        message = response.matches.first.map { |x| @@art.asciify(x) }.join
        response.reply render_template('lita-ascii-art', message: message)
      end
    end

    Lita.register_handler(AsciiArt)
  end
end
