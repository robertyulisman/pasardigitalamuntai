import React, {Component, Fragment} from 'react';
import {Text, View, StatusBar} from 'react-native';
import HomePage from './src/page/HomePage';
import Router from './config/router/router';
import {Warna} from './data';

export default class App extends Component {
  render() {
    return (
      <Fragment>
        
        <Router />
      </Fragment>
    );
  }
}
