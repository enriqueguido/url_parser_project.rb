class UrlParser
attr_accessor :new_url, :scheme


  def initialize(new_url)
    @new_url = new_url
    @scheme = new_url.split(":").first
  end
  #
  def domain
    new_url.split(":")[1].gsub("//", "")
  end

  def insecure_url
    por
  end

  def port
    port = new_url.split("/")[2].split(":")[1]
    if @scheme == "http" && port.nil?
      "80"
    elsif @scheme == "https" && port.nil?
      "443"
    else
      port
    end
  end

  def path
    new_url.split("?")[0].split("/")[3]
  end

  def query_string
    query_string = new_url.split("?")[1].split("#")[0].split("&")
    q = query_string.map do |i|
      i.split("=")
    end
      q.to_h
    # [0]
  end

  def fragment_id
    new_url.split("#")[1]
  end

end
