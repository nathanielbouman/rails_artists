class MuseumsController < ApplicationController
    
    layout 'standard'
    
  def index
      @museums = Museum.all
  end

  def show
    @museum = Museum.find(params[:id])
    @artists = @museum.artists.all
  end

  def new
    @museum = Museum.new({:name => "Default"})
  end

  def create
    # Instantiate a new object using form parameters
    @museum = Museum.new(museum_params)
    # Save the object
    if @museum.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Museum created successfully."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @museum = Museum.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
    @museum = Museum.find(params[:id])
    # Update the object
    if @museum.update_attributes(museum_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Museum updated successfully."
      redirect_to(:action => 'index')
    else
      # If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @museum = Museum.find(params[:id])
  end
  
  def join
      @museum = Museum.find(params[:id])
      @museumartists = @museum.artists.all
      @artists = Artist.all
  end
  
  def dojoin
      museum = Museum.find(params[:id])
      artist = Artist.find(params[:artistid])
      museum.artists << artist
      redirect_to(:action => 'show', :id => museum.id)
  end
  
  def remove
      museum = Museum.find(params[:id])
      artist = museum.artists.delete(params[:artistid])
      redirect_to(:action => 'show', :id => museum.id)
  end

  def destroy
    museum = Museum.find(params[:id]).destroy
    flash[:notice] = "Museum '#{museum.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end


  private

    def museum_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:museum).permit(:name, :position)
    end

end
