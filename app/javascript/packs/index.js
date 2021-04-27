import React from 'react';
import { render } from 'react-dom';
import Provider from '../components/Provider';
import Library from '../components/Library';
import UserInfo from '../components/UserInfo';

render(
  <Provider>
    <Library />
    <UserInfo />
  </Provider>, 
  document.querySelector('#root')
);