module CompileAssets
  extend ActiveSupport::Concern

  module ClassMethods
    def compile_sass(project,data)
      begin
        output = Sass::Engine.new(data).render
      rescue => e
        logger.warn "#{e}"
        project.errors[:sass] << "#{e}"
      end
    end

    def compile_slim(project,data)
      begin
        output = Slim::Template.new(convert_data("slim", data)).render
      rescue => e
        logger.warn "#{e}"
        project.errors[:slim] << "#{e}"
      end
    end

    def compile_coffee(file)
      sass_engine =  CoffeeScript::Engine.new(file)
      output = sass_engine
    end

    def convert_data(type, data)
      path = "app/views/to_compile/input."+type
      puts "\nStatus: writing data\n"
      File.open(path, 'w+') { |file| file.write(data) }
      puts "\nStatus: writing data Finished\n"
      path
    end
  end
end
