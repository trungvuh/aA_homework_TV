//this is where our app actions creator will live

const selectCurrency = (baseCurrency, rates) => ({
  type: "SWITCH_CURRENCY",
  baseCurrency,
  rates
});

export default selectCurrency;
