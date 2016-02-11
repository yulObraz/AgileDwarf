class MytasksController < ApplicationController
  unloadable

  def list
    # filter values

    sprint = nil
    user = @user = 'current'

    @plugin_path = File.join(Redmine::Utils.relative_url_root, 'plugin_assets', 'AgileDwarf')

    status_ids = []
    colcount = Setting.plugin_AgileDwarf[:stcolumncount].to_i
    for i in 1 .. colcount
      status_ids << Setting.plugin_AgileDwarf[('stcolumn' + i.to_s).to_sym].to_i
    end
    @statuses = {}
    #IssueStatus.find_all_by_id(status_ids).each {|x| @statuses[x.id] = x.name}
    IssueStatus.find(status_ids).each {|x| @statuses[x.id] = x.name}
    @columns = []
    for i in 0 .. colcount - 1
      @columns << {:tasks => SprintsTasks.get_all_tasks_by_status(status_ids[i], sprint, user), :id => status_ids[i]}
    end
  end  
end  
