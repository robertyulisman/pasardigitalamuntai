/**
 * @format
 */

import {AppRegistry} from 'react-native';
import App from './App';
import {name as appName} from './app.json';
import 'react-native-gesture-handler';
import React, {Component, Fragment} from 'react';
import {Text, View, StatusBar} from 'react-native';
import Splash from './src/page/Splash';
import {Provider} from 'react-redux';
import {store, persistor} from './src/store';
import {PersistGate} from 'redux-persist/integration/react';
import {Warna} from './data';
import codePush from 'react-native-code-push';

class MainApp extends Component {
  constructor() {
    super();
    this.state = {
      screen: 'Splash',
    };
    setTimeout(() => {
      this.setState({screen: 'App'});
    }, 5000);
  }
  render() {
    const {screen} = this.state;
    let mainScreen = screen === 'Splash' ? <Splash /> : <App />;
    return (
      <Provider store={store}>
        <PersistGate loading={null} persistor={persistor}>
          <StatusBar backgroundColor={Warna.hijauTua} />

          {mainScreen}
        </PersistGate>
      </Provider>
    );
  }
}

// AppRegistry.registerComponent(appName, () => MainApp);

let codePushOptions = {
  checkFrequency: codePush.CheckFrequency.ON_APP_START,
  installMode: codePush.InstallMode.IMMEDIATE,
};

let pushMainScreen = codePush(codePushOptions)(MainApp);

export default pushMainScreen;

AppRegistry.registerComponent(appName, () => pushMainScreen);
