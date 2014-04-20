require "spec_helper"

describe Lita::Handlers::AsciiArt, lita_handler: true do
  it { routes_command("ascii FRIDAY").to(:ascii_from_text) }

  describe "#ascii_from_text" do
    it "responds with ASCII art generated from the given text" do
      send_command "ascii FRIDAY"
      expect(replies.first).to match("  _____ ____  ___ ____    _ __   __\n |  ___|  _ \\|_ _|  _ \\  / \\\\ \\ / /\n | |_  | |_) || || | | |/ _ \\\\ V / \n |  _| |  _ < | || |_| / ___ \\| |  \n |_|   |_| \\_\\___|____/_/   \\_\\_|  \n                                   ")
    end
  end
end
