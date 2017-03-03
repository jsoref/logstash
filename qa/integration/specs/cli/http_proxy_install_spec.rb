# encoding: utf-8
require_relative "../../framework/fixture"
require_relative "../../framework/settings"
require_relative "../../services/logstash_service"
require_relative "../../services/http_proxy_service"
require_relative "../../framework/helpers"
require "logstash/devutils/rspec/spec_helper"
require "stud/temporary"
require "fileutils"

def gem_in_lock_file?(pattern, lock_file)
  content =  File.read(lock_file)
  content.match(pattern)
end

describe "(HTTP_PROXY) CLI > logstash-plugin install", :http_proxy => true do
  before(:all) do
    @fixture = Fixture.new(__FILE__)
    @logstash = @fixture.get_service("logstash")
    @logstash_plugin = @logstash.plugin_cli
    @pack_directory =  File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "fixtures", "logstash-dummy-pack"))
    @http_proxy =
  end

  context "when installing a plugin in an airgap environment" do
    context "when an http_proxy is configured" do
      before(:all) { @logtash.start_http_proxy }
      after(:all) { @logstash.stop_http_proxy }

      it "should allow me to install a plugin" do
      end
    end
  end
end
