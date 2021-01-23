require 'fileutils'

class Copyroo
  def initialize
    excluded_files = ['.git', 'scripts', 'diff.rb', 'install.rb', 'update.rb', 'README.md']
    @files = Dir.children(Dir.pwd).select { |f| !excluded_files.include?(f) }
  end

  def get_updates
    @files.each do |f|
      puts "Copying #{f} to home..."
      FileUtils.copy f, home_location(f)
    end
    puts 'Copying complete. Enjoy!'
  end

  def push_updates
    @files.each do |f|
      puts "Copying #{f} from home..."
      FileUtils.copy home_location(f), f
    end
    puts 'Copying complete. Please `git push`'
  end

  def diff_versions
    @files.each do |f|
      identical = File.open(home_location(f), 'r').read == File.open(f, 'r')
      if identical
        puts "No changes found in #{f}"
      else
        puts "Changes found in #{f}"
      end
    end
    puts 'Diffing complete.'
  end

  private

  def home_location(file)
    File.join(Dir.home, file)
  end
end
