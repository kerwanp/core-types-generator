const path = require('path')
const NodemonWebpackPlugin = require('nodemon-webpack-plugin')
const ESLintWebpackPlugin = require('eslint-webpack-plugin')

const {NODE_ENV, NODEMON} = process.env

const webpack = {
  mode: NODE_ENV,
  target: 'node',
  devtool: 'source-map',
  entry: path.resolve(__dirname, 'src/app.ts'),
  output: {
    path: path.resolve(__dirname, 'dist')
  },
  module: {
    rules: [
      {
        test: /.ts$/,
        include: /src/,
        loader: 'ts-loader'
      }
    ]
  },
  resolve: {
    extensions: ['.ts', '.js', '.json']
  },
  plugins: [new ESLintWebpackPlugin({ extensions: ['.ts']})]
}

if (NODEMON) {
  webpack.plugins.push(new NodemonWebpackPlugin())
}

module.exports = webpack
