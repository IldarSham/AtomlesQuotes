const express = require('express')
const quotes = require('./quotes.json')

const app = express()
const port = 3000

app.get('/quotes/:count', (req, res) => {
  const count = +req.params.count

  const arr = quotes.slice(0, count)
  res.json(arr)
})

app.listen(port, () => {
  console.log(`QuotesApp listening at http://localhost:${port}`)
})