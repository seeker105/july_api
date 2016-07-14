class DataFile
  attr_reader :name, :path, :parent_folder_id, :id

  def initialize(info_hash)
    @name = info_hash[:name]
    @path = info_hash[:path_lower]
    @parent_folder_id = info_hash[:parent_shared_folder_id]
    @id = info_hash[:id]
  end
end
