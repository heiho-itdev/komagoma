const { environment } = require('@rails/webpacker')

# ここから
const webpack = require('webpack')
environment.plugins.prepend(
    'Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery',
        Popper: ['popper.js', 'default']
    })
)
# ここまでを追加

module.exports = environment