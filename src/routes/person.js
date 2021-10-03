const express = require('express');
const router = express.Router();

const mysqlConnection  = require('../database.js');

// GET all persons
router.get('/', (req, res) => {
  mysqlConnection.query('SELECT * FROM person', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
});

// GET An person
router.get('/:id', (req, res) => {
  const { id } = req.params;
  mysqlConnection.query('SELECT * FROM person WHERE id = ?', [id], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
});

// DELETE An person
router.delete('/:id', (req, res) => {
  const { id } = req.params;
  mysqlConnection.query('DELETE FROM person WHERE id = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'person Deleted'});
    } else {
      console.log(err);
    }
  });
});

// INSERT An person
router.post('/', (req, res) => {
  const {id, fullname, birth, father_id, mother_id} = req.body;
  console.log(id, fullname, birth, father_id, mother_id);
  const query = `
    SET @id = ?;
    SET @fullname = ?;
    SET @birth = ?;
    SET @father_id = ?;
    SET @mother_id = ?;
    CALL personAddOrEdit(@id, @fullname, @birth, @father_id, @mother_id);
  `;
  mysqlConnection.query(query, [id, fullname, birth, father_id, mother_id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'person Saved'});
    } else {
      console.log(err);
    }
  });

});

// UPDATE An person
router.put('/:id', (req, res) => {
  const { name, salary } = req.body;
  const { id } = req.params;
  const query = `
    SET @id = ?;
    SET @name = ?;
    SET @salary = ?;
    CALL personAddOrEdit(@id, @name, @salary);
  `;
  mysqlConnection.query(query, [id, name, salary], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'person Updated'});
    } else {
      console.log(err);
    }
  });
});

module.exports = router;
