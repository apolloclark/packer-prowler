# spec/Dockerfile_spec.rb

require "serverspec"
require "docker"

Docker.validate_version!

describe "Dockerfile" do
  before(:all) do
    image = Docker::Image.get(
      ENV['DOCKER_USERNAME'] + "/" + \
      ENV['PACKAGE_NAME'] + ":" + \
      ENV['PACKAGE_VERSION'] + "-" + \
      ENV['IMAGE_NAME']
    )

    # https://github.com/mizzy/specinfra
    # https://docs.docker.com/engine/api/v1.24/#31-containers
    # https://github.com/swipely/docker-api
    # https://serverspec.org/resource_types.html
    set :os, family: :redhat
    set :backend, :docker
    set :docker_image, image.id
  end

  def os_version
    command("cat /etc/system-release").stdout
  end

  def sys_user
    command("whoami").stdout.strip
  end



  it "installs the right version of Centos" do
    expect(os_version).to include("Red Hat")
    expect(os_version).to include("6.8")
  end

  it "runs as root user" do
    expect(sys_user).to eql("root")
  end



  describe command("python --version") do
    its(:exit_status) { should eq 0 }
  end

  describe command("./prowler/prowler -V") do
    its(:exit_status) { should eq 0 }
  end
end
