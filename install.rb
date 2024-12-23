# frozen_string_literal: true

require 'fileutils'
require 'pathname'
require 'optparse'

class Installer
  EXCLUDED_FILES = [
    '.git',
    '.ruby-lsp',
    'scripts',
    'diff.rb',
    'install.rb',
    'update.rb',
    'README.md',
    'install.cr',
    'q8-cmk.json',
    'Brewfile',
    'omz-plugins.txt',
    'macos-install.md'
  ].freeze

  def self.install
    options = {}
    OptionParser.new do |opts|
      opts.banner = "Usage: install.rb [options]"
      opts.on("-v", "--verbose", "Run verbosely") do |v|
        options[:verbose] = v
      end
    end.parse!

    new(options).install
  end

  def initialize(options = {})
    @files = []
    @base_dotfile_path = Pathname.new(Dir.pwd)
    @base_home_path = Pathname.new(Dir.home)
    @verbose = options[:verbose] || false
    gather_files
  end

  def gather_files(prefix = '')
    Dir.children(@base_dotfile_path.join(prefix)).each do |f|
      next if EXCLUDED_FILES.include? f

      if File.directory? dotfile_path(prefix + f)
        gather_files("#{prefix}#{f}/")
      else
        @files << prefix + f
      end
    end
  end

  def in_main_directory?(directory)
    directory == Dir.pwd
  end

  def install
    @files.each do |f|
      puts "Evaluating #{f}" if @verbose
      install_path = @base_home_path.join f
      file_exists = file_exists? install_path

      if file_exists
        file_symlinked? f
      else
        symlink_response = ''
        validate_input do
          symlink_response = handle_input
        end

        create_symlink f if symlink_response == 'y'
      end
    end
  end

  def home_path(file)
    @base_home_path.join(file)
  end

  def dotfile_path(file)
    @base_dotfile_path.join(file)
  end

  def file_symlinked?(file_name)
    file_home_path = home_path(file_name)
    is_symlink = File.symlink? file_home_path
    if is_symlink
      symlink_to_dotfile_dir = File.readlink(file_home_path) == dotfile_path(file_name).to_s
      if symlink_to_dotfile_dir
        puts "#{file_home_path} is symlinked to dotfiles directory" if @verbose
      else
        puts "It appears that #{file_home_path} is symlinked to a different file. :("
      end
    else
      puts "A file exists at #{file_home_path} but does not appear to be a symlink."
    end
    is_symlink
  end

  def file_exists?(file_path)
    exists = File.exist?(file_path)
    if exists
      puts "A file was found at #{file_path}" if @verbose
    else
      puts "No file found at #{file_path}"
    end
    exists
  end

  def create_symlink(file = '')
    symlink_path = @base_home_path.join(file)
    home_dir = symlink_path.dirname
    unless Dir.exist? home_dir
      puts 'Creating directories' if @verbose
      FileUtils.mkdir_p(home_dir)
    end
    File.symlink(dotfile_path(file), symlink_path)
  end

  def handle_input
    puts 'Create symlink? (y/n)'
    input = gets || ''
    input = input.chomp
    input.downcase
  end

  def validate_input
    valid = false
    until valid
      input = yield
      valid = %w[y n].include?(input)
    end
    input
  end
end

Installer.install
