module Pipidaster
  module InstanceMethods
    MPATH_DELIMETER = '.'

    def children
      parent_path = mpath.nil? ? id.to_s : node_current_path
      self.class.where(mpath: parent_path)
                .order(:created_at)
    end

    def ancestors?
      mpath.present?
    end

    def descendants
      self.class.where("mpath LIKE ? OR mpath = '?'", "#{child_parent_node}%", id)
                .order(:created_at)
    end

    def parent
      self.class.find(parent_id) if ancestors?
    end

    def parent= parent
      value = parent.nil? ? nil : parent.child_parent_node
      write_attribute(:mpath, value)
    end

    def parent_id
      ancestor_ids.last if ancestors?
    end

    def parent_id= new_parent_id
      self.parent = self.class.exists?(new_parent_id) ? self.class.find(new_parent_id) : nil
    end

    def ancestor_ids
      mpath.blank? ? [] : mpath.split(MPATH_DELIMETER)
    end

    def child_parent_node
      if mpath.blank?
        id.to_s
      else
        node_current_path
      end
    end

    private

    def node_current_path
      [mpath, id].join(MPATH_DELIMETER)
    end

    def destroy_descendants
      descendants.destroy_all
    end
  end
end
