axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
slugify      = require 'slugify'
contentful   = require 'roots-contentful'
md           = require 'marked'
test         = {}
currentYear  = 2019

getTyne = (entry) ->
	if entry.slug == 'tyne-morgan'
		test["tyne"] = entry
getDateVars = (entry) ->
	#console.log(entry)
	if entry.fields.timeSlot != undefined
		dateToFormat = entry.fields.timeSlot
	if dateToFormat != undefined
		days = ["","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
		months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
		dateoo = new Date(dateToFormat)
		entry.dateFormatted = {}
		entry.dateFormatted.test = entry.artistName
		entry.dateFormatted.default = dateoo
		entry.dateFormatted.day = dateoo.getDate()
		entry.dateFormatted.dayName = days[dateoo.getDay()]
		entry.dateFormatted.month = months[dateoo.getMonth()]
		entry.dateFormatted.year = dateoo.getFullYear()
		entry.dateFormatted.hour = if dateoo.getHours() >= 12 then dateoo.getHours() - 12 else dateoo.getHours()
		if entry.dateFormatted.hour == 0
			entry.dateFormatted.hour = 12
		entry.dateFormatted.ampm = if dateoo.getHours() >= 12 then "PM" else "AM"
		entry.dateFormatted.minutes = if dateoo.getMinutes() < 10 then '0' + dateoo.getMinutes() else dateoo.getMinutes()
		#console.log(JSON.stringify(entry.dateFormatted))

module.exports =
	output: 'public'
	env: 'en'
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
					transform: getTyne
				sponsors:
					id:'sponsor'
				QA:
					id:"qASection"
					filters:{
						'order':'fields.order'
					}
				events:
					id:"scheduleSection"
					filters:{
						'order':'fields.order'
					}
				# eventItems:
				# 	id:"scheduleItem"
				# 	transform: getDateVars
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

	locals:
		env: 'en'
		basedir: 'views'
		md: require 'marked'
		d: getDateVars
		tyne: test
		currentYear: currentYear
