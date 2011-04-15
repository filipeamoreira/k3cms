module K3::Ribbon::RibbonHelper
  def self.included(base)
    #puts "#{self} was included"
  end

  def k3_ribbon
    render_cell 'k3/ribbon', :show,
      :k3_ribbon_items   => @k3_ribbon_items,
      :k3_ribbon_drawers => @k3_ribbon_drawers
  end

  def k3_ribbon_add_item(to_what = :top)
    @k3_ribbon_items ||= {}
    @k3_ribbon_items[to_what] ||= []
    @k3_ribbon_items[to_what] << capture { yield }
    nil
  end

  def k3_ribbon_render_drawer(name)
    render_cell('k3/ribbon', :drawer, :name => name, :content => capture { yield })
  end

  def k3_ribbon_add_drawer(name)
    @k3_ribbon_drawers ||= {}
    @k3_ribbon_drawers[name] = k3_ribbon_render_drawer(name) { yield }
    nil
  end

  def edit_mode?
    session[:edit_mode] = false if session[:edit_mode].nil?
    session[:edit_mode]
  end
end

