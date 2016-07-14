class Folder
  attr_reader :name, :path

  def initialize(info_hash)
    @name = info_hash[:name]
    @path = info_hash[:path_lower]
  end

  def self.all(current_user)
    result = DropboxService.new.get_folder_list(current_user)
    final = []
    result.each do |raw_data|
      final << Folder.new(raw_data)
    end
    return final
  end

  def self.find(current_user, path)
    contents = DropboxService.new.get_folder_contents(current_user, path)
    folders = []
    files = []
    contents.each do |content|
      folders << Folder.new(content) if content[:".tag"] == "folder"
      files << DataFile.new(content) if (content[:".tag"] == "file")
    end
    return [folders, files]
  end


end
