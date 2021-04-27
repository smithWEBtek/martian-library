import React from 'react';
import { render } from 'react-dom';
import Provider from '../components/Provider';
import UserInfo from '../components/UserInfo';
import Library from '../components/Library';
import AddItemForm from '../components/AddItemForm';

render(
  <Provider>
    <UserInfo />
    <AddItemForm />
    <Library />
  </Provider>, 
  document.querySelector('#root')
);