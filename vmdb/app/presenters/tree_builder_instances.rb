class TreeBuilderInstances < TreeBuilder
  def tree_init_options(tree_name)
    {
      :leaf => 'VmCloud' # FIXME: check
    }
  end

  def x_get_tree_roots(options)
    objects = rbac_filtered_objects(EmsCloud.order("lower(name)"), :match_via_descendants => "VmCloud")
    objects += [
      {:id => "arch", :text => "<Archived>", :image => "currentstate-archived", :tip => "Archived Instances"},
      {:id => "orph", :text => "<Orphaned>", :image => "currentstate-orphaned", :tip => "Orphaned Instances"}
    ]
    count_only_or_objects(options[:count_only], objects, nil)
  end

  include TreeBuilderCommon
  include TreeBuilderArchived
end
