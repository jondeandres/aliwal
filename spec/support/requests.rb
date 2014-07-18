module RequestsFixtures
  def request_fixture(name)
    File.read(fixtures_path.join("requests/#{name}.json"))
  end

  def fixtures_path
    Pathname.new(File.expand_path('../../fixtures', __FILE__))
  end
end
