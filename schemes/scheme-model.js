const db = require("../data/db-config.js");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove
};

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes")
    .where({ id })
    .first();
}

function findSteps(id) {
  return db("steps")
    .select("steps.id", "scheme_name", "instructions")
    .join("schemes", "schemes.id", "scheme_id")
    .where("scheme_id", id);
}

function add(scheme) {
  return db("schemes")
    .insert(scheme)
    .then(ids => {
      const [id] = ids;
      return findById(id);
    });
}

function update(changes, id) {
  return db("schemes")
    .where({ id })
    .update(changes, "*");
}

function remove(id) {
  return db("schemes")
    .where({ id })
    .del();
}
