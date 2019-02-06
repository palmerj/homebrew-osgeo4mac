class WhiteboxTools < Formula
  desc "An advanced geospatial data analysis platform"
  homepage "https://www.uoguelph.ca/~hydrogeo/WhiteboxTools"
  url "https://github.com/jblindsay/whitebox-tools/releases/download/v0.14/WhiteboxTools_darwin_amd64.zip"
  # url "https://github.com/jblindsay/whitebox-tools.git",
  #   :branch => "master",
  #   :commit => "f0cf6af792de8f60dd8afb10e3f0a26df1c702c4"
  version "0.14.0"
  sha256 "da5f2f2b7fbfec3abb136b182e2254087b087604d33d8e1f384f0326d7e75e4e"

  bottle do
    root_url "https://dl.bintray.com/homebrew-osgeo/osgeo-bottles"
    cellar :any_skip_relocation
    rebuild 1
    sha256 "711ab8779ec3b1e0cdc2e1638a4bc93d840cc15bf13845ee50a5cc27ede7c866" => :mojave
    sha256 "711ab8779ec3b1e0cdc2e1638a4bc93d840cc15bf13845ee50a5cc27ede7c866" => :high_sierra
    sha256 "711ab8779ec3b1e0cdc2e1638a4bc93d840cc15bf13845ee50a5cc27ede7c866" => :sierra
  end

  revision 1

  # head "https://github.com/jblindsay/whitebox-tools.git", :branch => "master"

  def install
    cp_r buildpath.to_s, prefix.to_s
    mkdir bin.to_s
    ln_s "#{prefix}/WBT/whitebox_tools", "#{bin}/whitebox_tools"
  end

  test do
    system "#{bin}/whitebox_tools", "--toolbox=Slope"
  end
end