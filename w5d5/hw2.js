const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function beerNWings() {

  reader.question("Want some beer?", (answer) => {
    console.log(`${answer}! Gotcha!`);

      reader.question("Want some wings?", function (res) {
        console.log(`${res}! Gotcha!`);

        const first = (answer === 'yes') ? 'do' : 'don\'t';
        const second = (res === 'yes') ? 'do' : 'don\'t';

        console.log(`So you ${first} want beer and ${second} want wings`);
        reader.close();
      });
  });
}
