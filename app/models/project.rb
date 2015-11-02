class Project < ActiveRecord::Base
  include CompileAssets
  validates :name,:slim,:coffee, presence: true
  validate :project_has_no_errors
  after_save :update_compiled_assets
  # check for syntax errors
  def validate_and_compile(project, params)
    @html = compile_slim(project,params[:slim])
    @css = compile_sass(project,params[:sass])
    @js = compile_coffee(project,params[:coffee])
    if @css && @js && @html
      puts "\n\n#{@css}\n\n"
      puts "\n\n#{@html}\n\n"
      puts "\n\n#{@js}\n\n"
    end
    # allow save if there are no errors
    @save_project = project.errors.blank? ? true : false
    puts "\n\nvalidate and compile method results: #{project.errors.full_messages}\n\n"
    @project_errors = project.errors.full_messages
  end

  private
    def project_has_no_errors
        if @save_project
          @save_project
        else
          @project_errors.each do |msg|
            errors.add(:base, msg)
          end
        end
    end
    def update_compiled_assets
      update_columns(compliled_html: @html, compiled_css: @css, compiled_js: @js)
    end
end
