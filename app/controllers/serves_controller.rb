class ServesController < ApplicationController
  before_action :set_serf, only: [:edit, :update, :destroy]

  # GET /serves
  # GET /serves.json
  def index

    # if params[:input_date].nil?
    #   input_date = Time.now.strftime("%Y-%m")
    # else
    #   input_date = params[:input_date]
    # end
    
    if params[:input_date]
      @input_date = params[:input_date]
      @serves = Serve.joins(:member).group(:member_id).where("cast(serves.date as text) LIKE '#{params[:input_date]}%'").count.sort_by { |k,v| v}.reverse 
    end

  end

  # GET /serves/1
  # GET /serves/1.json
  def show
  end

  # GET /serves/new
  def new
    @serf = Serve.new
  end

  # GET /serves/1/edit
  def edit
  end

  # POST /serves
  # POST /serves.json
  def create
    @serf = Serve.new(serf_params)

    respond_to do |format|
      if @serf.save

        member = Member.find(params[:serve][:member_id])

        if member.member_type == "Punch Card"

          old_balance = member.pc_balance

          member.decrement! :pc_balance

          format.html { redirect_to root_path, notice: "Punch Card ลดลงเหลือ  #{member.pc_balance} จาก #{old_balance}" }
        else

          format.html { redirect_to root_path, notice: 'Serve was successfully Checkin.' }
        end

        
      else
        format.html { render :new }
        format.json { render json: @serf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /serves/1
  # PATCH/PUT /serves/1.json
  def update
    respond_to do |format|
      if @serf.update(checkout_time: Time.now.strftime("%H:%M:%S"))
        format.html { redirect_to root_path, notice: 'Serve was successfully updated.' }
        format.json { render :show, status: :ok, location: @serf }
      else
        format.html { render :edit }
        format.json { render json: @serf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /serves/1
  # DELETE /serves/1.json
  def destroy
    @serf.destroy
    respond_to do |format|
      format.html { redirect_to serves_url, notice: 'Serve was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def checkout_all
    respond_to do |format|
       if Serve.where(checkout_time: nil).update_all(checkout_time: Time.now.strftime("%H:%M:%S"))
         format.html { redirect_to root_path, notice: 'Checkin was successfully updated.' }
         format.json { render :show, status: :ok, location: @checkin }
       else
         format.html { render :edit }
         format.json { render json: @checkin.errors, status: :unprocessable_entity }
       end
     end
  end

  def serve_info

    @serves = Serve.where("member_id=#{params[:id]} and  cast(date as text) LIKE '#{params[:date]}%'")

    render 'serves/serve_info'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_serf
      @serf = Serve.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def serf_params
      params[:serve][:member_id] = Member.find_by_code(params[:serve][:member_id]).id

      params.require(:serve).permit(:date, :checkin_time, :checkout_time, :member_id)
    end
end
