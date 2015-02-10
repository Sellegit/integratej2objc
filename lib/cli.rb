

require 'rubygems'
require 'thor'
require 'j2objc_shared_lib_smanger'

module IntegrateJ2objc
	class CLI < Thor
		desc "integrate_source", 
		%[For use with any source directory and Xcode project. Removes GROUP and descendant files] +
		%[ from XCODEPROJ and then adds all directories and files from SOURCE_ROOT, recursively, to] +
		%[ the GROUP and TARGET]
		method_option :project_root, required: true, 
		type: :string, 
		aliases: "-p"
		method_option :xcodeproj, required: true, type: :string, aliases: "-x"
		method_option :source_root, required: true, type: :string, aliases: "-s"
		method_option :group, required: true, type: :string, aliases: "-g", 
			desc: "This is the path to the group you are targeting from the xcode project, in Xcode"+
			" For example in Xcode Project Navigator you see:\n"+
			"\t\t\t\tMyProject.xcodeproj\n"+
			"\t\t\t\t  \u2514 MyProject\n"+
			"\t\t\t\t      \u2514 generated\n" +
			"\t\t\t\twould have a group argument: -g \"MyProject/generated\""
				
		method_option :target, required: true, type: :string, aliases: "-t"		
		def integrate_source()
			J2ObjcSharedLibSmanger.new().integrate_source(options);
		end
	end
end