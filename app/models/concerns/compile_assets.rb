module CompileAssets
  extend ActiveSupport::Concern

    private
      def compile_sass(project,data)
        begin
          output = Sass::Engine.new(data).render
        rescue => e
          project.errors[:sass] << "- #{e}"
        ensure
          project.errors[:sass].blank? ? output : false
        end
      end

      def compile_slim(project,data)
        begin
          output = Slim::Template.new(convert_data("slim", data)).render
        rescue => e
          project.errors[:slim] << "- #{e}"
        ensure
          project.errors[:slim].blank? ? output : false
        end
      end

      def compile_coffee(project,data)
        begin
          output =  CoffeeScript.compile(data)
        rescue => e
          project.errors[:coffee] << "- #{e}"
        ensure
          project.errors[:coffee].blank? ? output : false
        end


      end

      def convert_data(type, data)
        path = "app/views/to_compile/input."+type
        File.open(path, 'w+') { |file| file.write(data) }
        path
      end

end
