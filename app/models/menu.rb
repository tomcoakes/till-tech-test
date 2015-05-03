module Menu

  def load_from(file_location)
    JSON.parse(File.read(file_location))
  end

end