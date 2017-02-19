class ArtistsController < ApplicationController
    
    layout 'standard'
    
  def index
      @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @museums = @artist.museums.all
  end

  def new
    @artist = Artist.new({:name => "Default"})
  end

  def create
    # Instantiate a new object using form parameters
    @artist = Artist.new(artist_params)
    # Save the object
    if @artist.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Artist created successfully."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
    @artist = Artist.find(params[:id])
    # Update the object
    if @artist.update_attributes(artist_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Artist updated successfully."
      redirect_to(:action => 'index')
    else
      # If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @artist = Artist.find(params[:id])
  end
  
  def join
      @artist = Artist.find(params[:id])
      @artistmuseums = @artist.museums.all
      @museums = Museum.all
  end
  
  def dojoin
      artist = Artist.find(params[:id])
      museum = Museum.find(params[:museumid])
      artist.museums << museum
      redirect_to(:action => 'show', :id => artist.id)
  end
  
  def remove
      artist = Artist.find(params[:id])
      museum = artist.museums.delete(params[:museumid])
      #flash[:notice] = "Museum '#{museum.name}' removed from list successfully."
    redirect_to(:action => 'show', :id => artist.id)
      
  end

  def destroy
    artist = Artist.find(params[:id]).destroy
    flash[:notice] = "Artist '#{artist.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end


  private

    def artist_params
      params.require(:artist).permit(:name, :position)
    end

end
