# spec/Dockerfile_spec.rb

require_relative "spec_helper"

describe "Dockerfile" do
  before(:all) do
    load_docker_image()
    set :os, family: :debian
  end

  describe "Dockerfile#running" do
    it "runs the right version of Debian" do
      expect(os_version).to include("Debian")
      expect(os_version).to include("GNU/Linux 10")
    end
    it "runs as root user" do
      expect(sys_user).to eql("root")
    end
  end

  describe command("python --version") do
    its(:exit_status) { should eq 0 }
  end

  describe command("pip --version") do
    its(:exit_status) { should eq 0 }
  end

  describe command("./prowler/prowler -V") do
    its(:exit_status) { should eq 0 }
  end
end
