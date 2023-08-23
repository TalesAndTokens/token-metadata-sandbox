require "fileutils"
require "json"

Dir.glob("public/**/*").each do |path|
  File.delete(path) if File.file?(path)
end

Dir.glob("source/**/*.json").each do |path|
  JSON.load(File.read(path))

  public_path = path.sub("source", "public").sub(".json", "")
  public_dir = File.dirname(public_path)

  FileUtils.mkdir_p(public_dir) unless File.exist?(public_dir)
  FileUtils.copy(path, public_path)

  puts "Copy #{path} to #{public_path}"
end
