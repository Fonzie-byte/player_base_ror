module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_employee

    def connect
      set_current_employee || reject_unauthorized_connection
    end

    private
      def set_current_employee
        if (session = Session.find_by(id: cookies.signed[:session_id]))
          self.current_employee = session.employee
        end
      end
  end
end
