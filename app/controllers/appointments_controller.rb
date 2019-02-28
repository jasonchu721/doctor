class AppointmentsController < ApplicationController
  before_action :set_physician

  def index
    @xrays = @physician.appointments.where(role: 'xray')
    @physicals = @physician.appointments.where(role: 'physicals')
    @routines = @physician.appointments.where(role: 'routines')
  end

  def show
  end

  def new
    @patients = Patient.all - @physician.patients
    @appointment = @physician.appointments.new
  end

  def create
    @appointment = @physician.appointments.new(appointment_params)
    
    if @appointment.save
      redirect_to physician_appointments_path(@physician)
    else
      render :new
    end
  end

  def destroy
    @apointment = @physician.appointments.find(params[:id])
    @appointment.destroy
    redirect_to physician_appointments_path(@physician)
  end

 private
   def set_physician
     @physician = Physician.find(params[:physician_id]) 
   end

   def appointment_params
     params.require(:appointment).permit(:role, :patient_id)
   end
end
