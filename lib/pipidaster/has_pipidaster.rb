module Pipidaster
  module HasPipidaster
    def has_pipidaster
      include Pipidaster::InstanceMethods

      scope :roots, -> { where(mpath: nil).order(:created_at) }

      before_destroy :destroy_descendants
    end
  end
end

ActiveSupport.on_load :active_record do
  send :extend, Pipidaster::HasPipidaster
end
