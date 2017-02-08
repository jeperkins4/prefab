class Api::<%= file_name.camelize %> < Api::Base

  def initialize(url, key, secret)
    super
  end

  def run
    results = JSON.parse(open(url).read)
  end
end
