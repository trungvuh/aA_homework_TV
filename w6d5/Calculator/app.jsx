//this is the "entry" file

import React from 'react';
import ReactDOM from 'react-dom';

import Calculator from './calculator';

document.addEventListener('DOMContentLoaded', function () {
  ReactDOM.render(<Calculator />, document.getElementById('main'));
});
