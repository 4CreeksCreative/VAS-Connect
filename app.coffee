axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
slugify      = require 'slugify'
contentful   = require 'roots-contentful'
md           = require 'marked'

module.exports =
	output: 'public'
	env: 'en'
	locals:
		env: 'en'
		basedir: 'views'
		md: require 'marked'
		
	ignores: ['start_app.js','readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf','**/public/**','**/img/resized/*','**/img/stack/*','*.coffee']

	extensions: [
		js_pipeline(files: ['assets/js/*.js','assets/js/*.coffee']),
		css_pipeline(files: ['assets/css/*.css','assets/css/*.styl'])
		contentful
			access_token: '47134c48f600783d7c4bf8b93d58acf22e41cfe53f1e6183a8dbed1c00ec3b81'
			space_id: '4w502gnanmnv'
			content_types:
				speakers:
					id:'speaker'
					template:'views/partials/_bio.jade'
					filters:{
						'order': 'fields.speakerId'
					}
					path: (e) -> "speaker/#{e.slug}"
				sponsors:
					id:'sponsor'
				QA:
					id:"qASection"
					filters:{
						'order':'fields.order'
					}
	]

	stylus:
		use: [axis(), rupture(), autoprefixer()]
		sourcemap: true

	'coffee-script':
		sourcemap: true

	jade:
		pretty: true

	server:
		clean_urls:true
