const express = require('express');
const mysql = require('mysql');

// create connection
const db = mysql.createConnection({
  host: process.env.HOST,
  user: process.env.USER,
  password: process.env.PASSWORD,
  database: process.env.DATABASE,
});

// ini file nya

// connect to db
db.connect(err => {
  if (err) {
    throw err;
  }
  console.log('mysql connected');
});

const app = express();

const port = '5000' || process.env.PORT;
app.listen(port, () => {
  console.log(`server starting on port ${port}`);
});

// get produk
app.get('/produk', (req, res) => {
  let sql = 'SELECT * FROM produk';
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send({
      sukses: true,
      data: result,
    });
  });
});

// get kategori produk
app.get('/kategori', (req, res) => {
  let sql = 'SELECT * FROM kategori_produk';
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send({
      sukses: true,
      data: result,
    });
  });
});

// get profile
app.get('/profile', (req, res) => {
  let sql = 'SELECT * FROM profile';
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send({
      sukses: true,
      data: result,
    });
  });
});

// get promo
app.get('/promo', (req, res) => {
  let sql = 'SELECT * FROM promo';
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send({
      sukses: true,
      data: result,
    });
  });
});

// get slide
app.get('/slide', (req, res) => {
  let sql = 'SELECT * FROM slide';
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send({
      sukses: true,
      data: result,
    });
  });
});

// get sosmed
app.get('/sosmed', (req, res) => {
  let sql = 'SELECT * FROM sosmed';
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send({
      sukses: true,
      data: result,
    });
  });
});
