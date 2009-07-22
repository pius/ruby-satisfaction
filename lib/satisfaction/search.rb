class Sfn::Search
  attr_reader :results, :root_url, :loader
  
  def initialize(root_url, loader)
    @root_url = root_url
    @loader = loader
    @results = {}
  end
  
  def for_likely_matches_to(name, entities = %w(companies products))
    @results = entities.inject({}) {|hash, entity|
      query_string = "#{@root_url}/#{entity}.json?q=#{name}"
      #result = Net::HTTP.get_response(URI.parse(query_string)).body
      answer = @loader.get(query_string)
      if answer[0] == :ok
        result = answer[1]
        #raise result.inspect
        hash.merge({entity => JSON.parse(result)['data']})
      else
        raise "Search service not available at the moment, please try again later."
      end
    }
  end
end