class Project < ActiveRecord::Base
  include CompileAssets
  #validates_each :name, :slim, :sass, :coffeescript, presence: true
  before_save :project_has_no_errors, only: [:create, :update]


  def self.validate_and_compile(project, params)
    html = compile_slim(project,params[:slim])
    css = compile_sass(project,params[:sass])
    #js = compile_coffee(coffee)
    puts "\n\n#{css}\n\n"
    puts "\n\n#{html}\n\n"
    project.errors.full_messages.each do |e|
      puts "\n\n#{e}\n\n"
    end
    # allow save if there are no errors
    @save_project = project.errors.blank? ? true : false
  end

  def project_has_no_errors
      puts "\nthe value of save is: #{Project.instance_variable_get(:@save_project)}\n"
      value = Project.instance_variable_get(:@save_project)
  end


end
