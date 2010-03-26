module GemLoader
  module VERSION
    STRING = File.open(File.expand_path("../../../VERSION", __FILE__)).read.chomp
  end
end
