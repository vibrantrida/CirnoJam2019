const fs = require('fs')

const projectConfig = require(process.cwd() + '\\project.config.json')
const spritesConfig = require(process.cwd() + '\\' + projectConfig.shortname + '\\sprites.config.json')

module.exports = {
	params: () => {
	    return {
	    	...projectConfig,
	    	...spritesConfig
	    }
	}
}
