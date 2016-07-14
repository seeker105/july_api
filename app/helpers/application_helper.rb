module ApplicationHelper
  def format_file_trace(path_trace)
    if path_trace.length > 0
      path_trace[0] = ''
      path_trace.gsub("/", " > ")
    end
  end
end
