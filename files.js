// browser(1995) + node(2007) + deno + bun +
// filesSystem-- create, read, update, delete files
// os , other applications(database), network()
// fs module in nodejs
// import that code -- fs module -- es6
const fs = require("fs");

fs.appendFileSync("database.sql", "hello ia am albert the db creator", "utf-8");

for (let i = 0; i < 100; i++) {
  // fs.writeFileSync(`student${i}.txt`, `hello this is student ${i}`, "utf-8");
  //   fs.unlinkSync(`student${i}.txt`);
}
const os = require("os");
console.log(os.cpus().length);
console.log(os.platform());
console.log(os.freemem() / (1024 * 1024 * 1024));
