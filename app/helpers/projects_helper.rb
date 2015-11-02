module ProjectsHelper
  def compile_sass(data)
    sass_engine = Sass::Engine.new(data)
    output = sass_engine.render
  end
  def compile_slim(data)
    puts "#{data}"
    begin
      output = Slim::Template.new(convert_data("slim", data)).render
    rescue => e
      logger.warn "Unable to foo, will ignore: #{e}"
      @projects.errors.add(:slim, "#{e}" ) 
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
  def validate_and_compile(slim,sass)
    html = compile_slim(slim)
    css = compile_sass(sass)
    #js = compile_coffee(coffee)
    puts "\n\n#{css}\n\n"
    puts "\n\n#{html}\n\n"
    #puts "\n\n#{js}\n\n"
  end
end
