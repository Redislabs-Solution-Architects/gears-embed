const webpack = require('webpack');

module.exports = {
    entry: './src/gear.js',
    mode: "production",
    plugins: [
        new webpack.BannerPlugin({
			banner:'#!js api_version=1.0 name=lib',
            raw: true,
            entryOnly: true,
	    })
	]
}