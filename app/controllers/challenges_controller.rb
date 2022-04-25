class ChallengesController < ApplicationController
  http_basic_authenticate_with name: 'ftf', password: 'secret', except: [:index, :show, :checkout]

  before_action :set_challenge, only: %i[ show edit update solve ]

  # GET /challenges or /challenges.json
  def index
    @challenges = Challenge.all
  end

  # GET /challenges/1 or /challenges/1.json
  def show
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new()
  end

  # POST /challenges or /challenges.json
  def create
    @challenge = Challenge.new(challenge_params)

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to challenges_url(@challenge), notice: "Challenge was successfully created." }
        format.json { render :show, status: :created, location: @hallenge }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @challenge.update!(challenge_params)
    redirect_to @challenge
  end

  def solve
    respond_to do |format|
      if @challenge.solve!(solve_params[:flag])
        format.json { render status: :ok }
      else
        format.json { render status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def challenge_params
      params.require(:challenge).permit(:name, :description, :status, tasks_attributes: [:id, :question, :flag])
    end
    
    def solve_params
      params.require(:challenge).permit(:flag)
    end
end
