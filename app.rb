include Mongo

mongo_uri = ENV['MONGOLAB_URI'] || 'mongodb://localhost:27017'

mongo = MongoClient.from_uri(mongo_uri)

get '/' do
	# mongodb usage -- see README for proper db setup
	db = mongo['test']
	logger.info(db['testCollection'].find({'foo' => 'bar'}).first)

	erb :index
end
