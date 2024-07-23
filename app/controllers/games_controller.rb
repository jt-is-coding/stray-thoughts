class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]
  giant_bomb_key = ENV.fetch("GIANT_BOMB_KEY")

  # GET /games or /games.json
  def index
    @games = Game.all
  end

  # GET /games/1 or /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  def search

    
    @game_list = []
    user_year = params.fetch("year")

    if user_year.to_i > 2023 || user_year.to_i < 1972
      user_year = rand(1972..2023)
    end

    giant_bomb_url1 = "https://www.giantbomb.com/api/games/?api_key=#{giant_bomb_key}&format=json&field_list=name,deck,image,platforms&filter=expected_release_year:#{user_year}"
    raw_response = HTTP.get(giant_bomb_url1)
    @parsed_response = JSON.parse(raw_response)
    max_number = @parsed_response.fetch("number_of_total_results")
    max_offset = max_number.to_i - 100
    
    if max_number > 100
      giant_bomb_url2 = "https://www.giantbomb.com/api/games/?api_key=#{giant_bomb_key}&format=json&field_list=name,deck,image,platforms&offset=#{rand(100..max_offset)}&filter=expected_release_year:#{user_year}"
      raw_response = HTTP.get(giant_bomb_url2)
      @parsed_response = JSON.parse(raw_response)
      @offset = @parsed_response.fetch("offset")
      @results = @parsed_response.fetch("results")
      @results.each do |number|
        @game_list.push(number)
      end
    else
      @results = @parsed_response.fetch("results")
      @results.each do |number|
      @game_list.push(number)
    end
  end
end

  # POST /games or /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to game_url(@game), notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to game_url(@game), notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy!

    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:title, :image, :platforms, :description, :api_id)
    end
end
