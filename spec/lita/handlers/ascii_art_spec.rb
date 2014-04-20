require "spec_helper"

describe Lita::Handlers::AsciiArt, lita_handler: true do
  it { routes_command("ascii FRIDAY").to(:ascii_from_text) }

  describe "#ascii_from_text" do
    it "responds with ASCII art generated from the given text" do
      send_command "ascii FRIDAY"
      expect(replies[0]).to match("  ______ _____  _____ _____      __     __")
      expect(replies[1]).to match(" |  ____|  __ \|_   _|  __ \   /\\ \   / /")
      expect(replies[2]).to match(" | |__  | |__) | | | | |  | | /  \\ \_/ / ")
      expect(replies[3]).to match(" |  __| |  _  /  | | | |  | |/ /\ \\   /  ")
      expect(replies[4]).to match(" | |    | | \ \ _| |_| |__| / ____ \| |   ")
      expect(replies[5]).to match(" |_|    |_|  \_\_____|_____/_/    \_\_|   ")
      expect(replies[6]).to match("                                          ")
    end
  end
end
