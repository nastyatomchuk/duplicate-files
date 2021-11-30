require 'digest'

class Sha1Digester
  def digest(file_path)
    Digest::SHA1.hexdigest(File.read(file_path))
  end
end
