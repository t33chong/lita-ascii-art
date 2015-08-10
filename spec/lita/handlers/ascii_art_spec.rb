require "spec_helper"

describe Lita::Handlers::AsciiArt, lita_handler: true do
  it { is_expected.to route_command("ascii FRIDAY").to(:ascii_from_text) }

  describe "#ascii_from_text" do
    it "responds with ASCII art generated from the given text" do
      send_command "ascii FRIDAY"
      expect(replies.first).to match("  _____ ____  ___ ____    _ __   __\n |  ___|  _ \\|_ _|  _ \\  / \\\\ \\ / /\n | |_  | |_) || || | | |/ _ \\\\ V / \n |  _| |  _ < | || |_| / ___ \\| |  \n |_|   |_| \\_\\___|____/_/   \\_\\_|  \n                                   ")
    end

    it "formats the response with a code block if the Slack adapter is in use" do
      registry.config.robot.adapter = :slack
      send_command 'ascii FRIDAY'
      expect(replies.first).to start_with("```")
      expect(replies.first).to end_with("```")
    end

    it "formats the response with a quote if the HipChat adapter is in use" do
      registry.config.robot.adapter = :hipchat
      send_command 'ascii FRIDAY'
      expect(replies.first).to start_with("/quote")
    end
  end
end
