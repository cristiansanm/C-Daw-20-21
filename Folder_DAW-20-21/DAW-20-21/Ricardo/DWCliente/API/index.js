'use strict'

const express = require('express')

const bodyParser = require('body-parser')

const port = process.env.PORT || 3001
const app = express()

const mongoose = require('mongoose')

const Producto = require('./modelos/productos')


app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

app.get('/adios', (req, res) => {
  res.send({ message: 'adios, es tarde' })
})

app.get('/adios/:name', (req, res) => {
  res.send({ message: `adios, es ${req.params.name}` })
})

app.get('/api/productos', (req, res) => {
  res.send(200, { productos: [] })
})

app.get('/api/productos/:id', (req, res) => {
  
})

app.post('/api/productos', (req, res) => {
  console.log(req.body)
  res.send(200, { message: 'El producto se ha recibido' })
})

app.put('/api/productos/:id', (req, res) => {
  
})

app.delete('/api/productos/:id', (req, res) => {
  
})

mongoose.connect('mongodb://localhost/tienda', (err, res) => {  
  if (err) {
    return console.log(` Error al conectar con el Mongo ${err} `)
  }
  console.log('Conexion con el Mongo OK')
  app.listen(port, () => {
    console.log(`API REST Node.js https://localhost:${port}`)
  })
})

