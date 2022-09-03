class ReservationsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_reservation, only: %i[ show edit update destroy ]

  # GET /reservations or /reservations.json
  def index
    @reservations = policy_scope(Reservation).where(week:Date.today.cweek)
    monday = Date.today.next_occurring(:monday).day - 7
    @days = (monday..(monday + 4)).to_a
    @reservations_hash = generate_reservations_hash(@reservations, @days)
    @reservation = Reservation.new
  end

  # GET /reservations/1 or /reservations/1.json
  def show
  end

  # GET /reservations/new
  # def new
  #   @reservation = current_user.reservations.new
  # end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations or /reservations.json
  def create
    @reservation = current_user.reservations.new(reservation_params)
    today = Date.today
    @reservation.month = today.month
    @reservation.week = today.cweek
    @reservation.year = today.year
    flash[:notice] = 'Reservation made successfully!' if @reservation.save
    redirect_to root_path
    # authorize @reservation
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(description: params[:reservation][:description])
    redirect_to root_path
    # authorize @reservation
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to root_path
    # authorize @reservation
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
      # authorize @reservation
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:description, :hour, :day, :week, :month, :year)
    end

    def generate_reservations_hash(reservations, days)
      reservations_hash = days.each_with_object({}) do |day, hash|
        hash[day] = {}
      end
      reservations.each do |reservation|
        reservations_hash[reservation.day][reservation.hour] = reservation if reservations_hash[reservation.day]
      end
      reservations_hash
    end
end
