class AppointmentsController < ApplicationController
  before_action :set_physician

  def index
    @surgeons = @physician.appointments.where(type: 'surgeon')
    @oncologists = @physician.appointments.where(type: 'oncologist')
    @allergists = @physician.appointments.where(type: 'allergist')
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
    redirect_to physician_appointments_path(@doctor)
  end

 private
   def set_physician
     @physician = Physician.find(params[:physician_id]) 
   end

   def appointment_params
     params.require(:appointment).permit(:type, :patient_id)
   end
end
