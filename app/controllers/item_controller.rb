class ItemController < ApplicationController
  before_action :is_logged_in,
    def upload
      @directory_folder = DirectoryFolder.find(params[:id])
      @item = Item.new
    end
    def upload_item
      @directory_folder = DirectoryFolder.find(params[:id])
      @item = Item.new
      @item.directory_folder_id = params[:id]
      @item.file_name = params[:item][:file_name]
      @item.file_type = params[:item][:file_type]
      @item.image.attach(params[:item][:image_upload])
        respond_to do |format|
            if @item.valid?
              if params[:item][:image_upload] == nil 
                format.turbo_stream{render turbo_stream: turbo_stream.update("error","Upload file required.")}
              else
                @item.save
                format.html{redirect_to "/directory_folder/#{params[:id]}"}
              end
            else
              #format.html{redirect_to "/"}
              format.turbo_stream{render turbo_stream: turbo_stream.update("item_form",partial:"upload_form",locals:{item:@item})}
              #format.turbo_stream{render turbo_stream: turbo_stream.update("folder_form","Passwords did not match!")}
            end
        end
    end
    def edit
      @directory_folder = DirectoryFolder.find(params[:id])
      @item = Item.find(params[:item_id])
    end
    def edit_item
      @directory_folder = DirectoryFolder.find(params[:id])
      @item = Item.find(params[:item_id])
        respond_to do |format|
            if @item.update(item_params)
              if params[:item][:image_upload] == nil 
                puts 'no image/retain'
              else
                @item.image.purge
                @item.image.attach(params[:item][:image_upload])
              end
              format.html { redirect_to "/directory_folder/#{params[:id]}", notice: "Evac center was successfully updated." }
              format.json { render :show, status: :ok, location: @item }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @item.errors, status: :unprocessable_entity }
            end
          end
    end
    def delete_item
      @directory_folder = DirectoryFolder.find(params[:id])
      @item = Item.find(params[:item_id])
      @item.image.purge
      @item.destroy
      redirect_to @directory_folder
    end
    private
    def item_params
      params.require(:item).permit(:file_name, :file_type)
    end
end
