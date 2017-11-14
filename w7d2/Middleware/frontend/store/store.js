import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';


const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer, preloadedState, applyMiddleware(addLogginToDispatch));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

const addLogginToDispatch = store => next => action => {
  console.log(store.getState());
  console.log(action);
  let result = next(action);
  console.log(store.getState());
  return result;
};

export default configureStore;
