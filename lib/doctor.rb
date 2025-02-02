class Doctor
    attr_accessor :name, :patient, :date
    
    @@all = []
    
    def initialize(name)
        @name = name

        @@all << self
        
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select {|app|app.doctor == self}
    end

    def new_appointment(date, patient)
        Appointment.new(patient, date, self)
    end

    def patients
        appointments.map {|app|app.patient}
    end

end
