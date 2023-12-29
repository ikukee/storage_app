class DirectoryFolderController < ApplicationController

    def show
      @directory_folder = DirectoryFolder.find(params[:id])
      @items = @directory_folder.items
    end
    def new
        @directory_folder = DirectoryFolder.new

    end
    
      # GET /evac_centers/1/edit
    def edit
        @directory_folder = DirectoryFolder.find(params[:id])
    end
    
    def edit_folder
      @directory_folder = DirectoryFolder.find(params[:id])
      respond_to do |format|
        if @directory_folder.update(directory_folder_params)
          format.html { redirect_to @directory_folder, notice: "Evac center was successfully updated." }
          format.json { render :show, status: :ok, location: @directory_folder }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @directory_folder.errors, status: :unprocessable_entity }
        end
      end
    end
    # POST /evac_centers or /evac_centers.json
    def create
        @directory_folder = DirectoryFolder.new
        @directory_folder.name = params[:directory_folder][:name]
        @directory_folder.hidden = false
        @directory_folder.visibility = params[:directory_folder][:visibility]
        respond_to do |format|
          if @directory_folder.valid?
            @directory_folder.save
            format.html{redirect_to "/"}
          else
            #format.html{redirect_to "/"}
            format.turbo_stream{render turbo_stream: turbo_stream.update("folder_form",partial:"form",locals:{directory_folder:@directory_folder})}
            #format.turbo_stream{render turbo_stream: turbo_stream.update("folder_form","Passwords did not match!")}
          end
        end
    end
    private
    def directory_folder_params
      params.require(:directory_folder).permit(:name, :visibility)
    end
end