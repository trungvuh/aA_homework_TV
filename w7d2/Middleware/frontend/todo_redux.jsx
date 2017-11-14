import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// const addLogginToDispatch = (store) => {
//   let storeDispatch = store.dispatch;
//
//   return (action) => {
//
//     console.log(store.getState());
//     console.log(action);
//     storeDispatch(action);
//     console.log(store.getState());
//   };
// };
//


//
// const applyMiddleware = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach( middleware => {
//     dispatch = middleware(store)(dispatch);
//   });
//
//   return Object.assign({}, store, { dispatch });
// };


document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  // store.dispatch = addLogginToDispatch(store);
  // store = applyMiddleware(store, addLogginToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
