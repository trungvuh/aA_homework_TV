

function madLib(verb, adj, noun) {
  console.log(`We shall ${verb} the ${adj} ${noun}`);
}

// madLib('make', 'best', 'guac');

function isSubstring(searchString, subString) {
  return searchString.split(' ').includes(subString);
}

// isSubstring("time to program", "times");

function fizzbuzz(array) {
  const result = [];

  array.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      result.push(el);
    }
  });
  return result;
}

function isPrime(num) {
  if (num < 2) { return false; }
  for (let i = 2; i < num; i++) {
    if (num % i === 0) {
      return false;
    }
  }
  return true;
}

function sumOfNPrimes (n) {
  let sum = 0;
  let count = 0;
  let i = 2;

  while (count < n) {
    if (isPrime(i)) {
      sum += i;
      count++;
    }
    i++;
  }

  return sum;
}
