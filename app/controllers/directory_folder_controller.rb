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
    def upload
      @item = Item.new
    end
    def upload_item
      @item = Item.new
      @item.directory_folder_id = params[:id]
      @item.file_name = params[:item][:file_name]
      @item.image.attach(params[:item][:image_upload])
      respond_to do |format|
          if @item.valid?
            if params[:item][:image_upload] == nil 
              format.turbo_stream{render turbo_stream: turbo_stream.update("error","Upload file required.")}
            else
              @item.save
              format.html{redirect_to "/#{params[:id]}"}
            end
          else
            #format.html{redirect_to "/"}
            format.turbo_stream{render turbo_stream: turbo_stream.update("item_form",partial:"upload_form",locals:{item:@item})}
            #format.turbo_stream{render turbo_stream: turbo_stream.update("folder_form","Passwords did not match!")}
          end
        end
    end
end