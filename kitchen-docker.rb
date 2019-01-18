require 'kitchen/driver/docker'

module Kitchen
  module Driver
    class Docker < Kitchen::Driver::Base
      def login_command(state)
        LoginCommand.new(%W[
          docker exec -it #{state[:container_id]} bash
        ])
      end
    end
  end