require 'spec_helper'

describe 'stackdriver::default' do
  context 'on CentOS' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: 6.6) do |node|
        node.automatic['domain'] = 'example.com'
      end.converge(described_recipe)
    end

    it 'installs stackdriver-agent package' do
      expect(chef_run).to install_package('stackdriver-agent')
    end
  end
end
