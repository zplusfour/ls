#!/usr/bin/env node

const fs = require('fs');
require('colors');

const main = (argv) => {
  const emojis = {
    file: "",
    directory: ""
  };
  if (typeof argv[0] === 'undefined') {
    var rd = fs.readdirSync(".");
    for (const fod of rd) {
      var stats = fs.statSync(fod);
      if (stats.isFile() === true) {
        console.log(`${emojis.file} ${fod}`.yellow);
      } else {
        console.log(`${emojis.directory} ${fod}`.blue);
      }
    }
  } else {
    var rd = fs.readdirSync(argv[0]);
    for (const fod of rd) {
      var stats = fs.statSync(`${argv[0]}/${fod}`);
      if (stats.isFile() === true) {
        console.log(`${emojis.file} ${fod}`.yellow);
      } else {
        console.log(`${emojis.directory} ${fod}`.blue);
      }
    }

  }
};

main(process.argv.slice(2));