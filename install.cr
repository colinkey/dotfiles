class Dotfiles
	@files : Array(String)
	@base_dotfile_path : Path
	@base_home_path : Path

	EXCLUDED_FILES = [
		".git", 
		"scripts", 
		"diff.rb", 
		"install.rb", 
		"update.rb", 
		"README.md", 
		"install.cr",
		"q8-cmk.json"
	]

	def initialize
		@files = [] of String
		@base_dotfile_path = Path.new(Dir.current)
		@base_home_path = Path.home
		gather_files
	end

	def gather_files(prefix = "")
		Dir.children(@base_dotfile_path.join(prefix)).each do |f| 
			next if EXCLUDED_FILES.includes? f
			if File.directory? dotfile_path(prefix + f)
				gather_files(prefix + f + "/")
			else
				@files << prefix + f
			end
		end
	end

	def in_main_directory?(directory : String)
		directory == Dir.current
	end

	def install
		@files.each do |f|
			puts "Evaluating " + f
			install_path = @base_home_path.join f
			file_exists = file_exists? install_path

			if file_exists
				file_symlinked? f
			else
				symlink_response = ""
				validate_input do
					symlink_response = handle_input
				end

				if symlink_response == "y"
					create_symlink f
				end
			end
		end
	end

	def home_path(file : String)
		@base_home_path.join(file)
	end

	def dotfile_path(file : String)
		@base_dotfile_path.join(file)
	end

	def file_symlinked?(file_name)
		is_symlink = File.symlink? home_path(file_name)
		if is_symlink
			symlink_to_dotfile_dir = File.readlink(home_path(file_name)) == dotfile_path(file_name)
			if symlink_to_dotfile_dir
				puts "#{file_name} is symlinked to dotfiles directory"
			else
				puts "It appears that #{file_name} is symlinked to a different file. :("
			end
		end
		is_symlink
	end

	def file_exists?(file_path)
		exists = File.exists?(file_path)
		if exists
			puts "A file was found at #{file_path}"
		else
			puts "No file found at #{file_path}"
		end
		exists
	end

	def create_symlink(file = "")
		symlink_path = @base_home_path.join(file)
		home_dir = symlink_path.dirname
		if !(Dir.exists? home_dir)
			puts "Creating directories"
			Dir.mkdir_p(home_dir)
		end
		result = File.symlink(dotfile_path(file), symlink_path)
		puts "Result of symlink creation", result
	end

	def handle_input
		puts "Create symlink? (y/n)"
		input = gets || ""
		input = input.chomp
		input.downcase
	end

	def validate_input
		valid = false
		while !valid
			input = yield
			valid = input == "y" || input == "n"
		end
		input
	end	
end

a = Dotfiles.new
a.install
