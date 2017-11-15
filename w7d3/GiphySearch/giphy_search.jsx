import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
// import { fetchSearchGiphys, receiveSearchGiphys } from './actions/giphy_actions';

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  // window.store = store;
  // window.fetchSearchGiphys = fetchSearchGiphys;
  // window.receiveSearchGiphys = receiveSearchGiphys;

  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, rootEl);
});
