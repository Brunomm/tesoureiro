module Crud
	
	def initialize
		super
		@modelo        = self.class.name.gsub('Controller','').underscore.singularize.camelcase.constantize unless @modelo
		@nome_singular = @modelo.to_s.underscore
		@nome_plural   = @modelo.to_s.underscore.pluralize
	end
	
	def index
		set(@nome_plural,@modelo.order('updated_at DESC'))
	end
	
	def show
		busca_registro()
	end
	
	def new
		novo_registro()		
	end
	
	def create
		novo_registro(params[@nome_singular.to_sym])
		
		if @registro.save
			redirect_to(@registro)
		else
			render(action: :new)
		end
	end
	
	def edit
		busca_registro()
	end
	
	def update
		busca_registro()
		
		if @registro.update_attributes(params[@nome_singular.to_sym])
			redirect_to(@registro)
		else
			render(action: :edit)
		end
	end
	
	def destroy
		busca_registro()
		
		@registro.destroy
		
		redirect_to(action: :index)
	end
	
	protected
	
	def busca_registro
		set(@nome_singular,@modelo.find(params[:id]))
		@registro = get(@nome_singular)
	end
	
	def novo_registro(atributos={})
		set(@nome_singular,@modelo.new(atributos))
		@registro = get(@nome_singular)
	end
	
	def set(nome,valor)
		instance_variable_set("@#{nome}",valor)
	end
	
	def get(nome)
		instance_variable_get("@#{nome}")
	end
end