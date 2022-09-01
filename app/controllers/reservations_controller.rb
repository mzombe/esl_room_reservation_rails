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
  def new
    @reservation = current_user.reservations.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations or /reservations.json
  def create
    @reservation = current_user.reservations.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])

      authorize @reservation
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
        reservations_hash[reservation.day][reservation.hour] = reservation if reservation_hash[reservation.day]
      end
      reservations_hash
    end
end
