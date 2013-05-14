include Mongo

# mongodb setup -- see README for more
mongo_uri = ENV['MONGOLAB_URI'] || 'mongodb://localhost:27017'
mongo = MongoClient.from_uri(mongo_uri)
db = mongo[mongo_uri[%r{/([^/\?]+)(\?|$)}, 1] || 'test']


get '/' do
	# sanity check for mongo: a document with this needs to exist
	logger.info(db['testCollection'].find({'foo' => 'bar'}).first)

	erb :index
end
