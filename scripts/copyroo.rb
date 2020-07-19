require 'fileutils'

class Copyroo
  def initialize
    @excluded_files = ['.git', 'scripts', 'install.rb', 'update.rb', 'README.md']
    @files = Dir.children(Dir.pwd).select { |f| !@excluded_files.include?(f) }
  end

  def get_updates
    @files.each do |f|
      puts "Copying #{f} from git repo..."
      FileUtils.copy f, "../#{f}"
    end
    puts 'Copying complete. Enjoy!'
  end

  def push_updates
    @files.each do |f|
      puts "Pushing #{f} to git repo..."
      FileUtils.copy "../#{f}", f
    end
    puts 'Copying complete. Please `git push`'
  end
end
