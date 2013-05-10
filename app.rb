include Mongo

mongo = MongoClient.new('localhost', 27017)

get '/' do
	# mongodb usage -- see README for proper db setup
	db = mongo['test']
	logger.info(db['testCollection'].find({'foo' => 'bar'}).first)

	erb :index
end
