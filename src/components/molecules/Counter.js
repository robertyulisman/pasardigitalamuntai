import React, {Component} from 'react';
import {Text, View, TouchableOpacity} from 'react-native';
import {Warna} from '../../../data';

export default class Counter extends Component {
  constructor() {
    super();
    this.state = {
      value: 0,
    };
  }

  handleOnCounterChange = newValue => {
    // this.props.onCounterChange(newValue);
  };

  handleTambah = () => {
    this.setState({value: this.state.value + 1}, () => {
      this.handleOnCounterChange(this.state.value);
    });
  };

  handleKurang = () => {
    let {value} = this.state;
    if (value >= 1) {
      this.setState({value: this.state.value - 1}, () => {
        this.handleOnCounterChange(this.state.value);
      });
    } else {
      value = 0;
    }
  };

  render() {
    const {value} = this.state;
    // console.log('ini value', value);
    return (
      <View
        style={{
          flexDirection: 'row',
          marginTop: 10,
          alignItems: 'center',
        }}>
        <TouchableOpacity
          onPress={this.handleKurang}
          style={{
            height: 35,
            width: 35,
            backgroundColor: Warna.hijau,
            borderRadius: 5,
            alignItems: 'center',
            justifyContent: 'center',
          }}>
          <Text style={{color: Warna.putih, fontSize: 18}}>-</Text>
        </TouchableOpacity>
        <Text style={{marginHorizontal: 30, fontSize: 22}}>{value}</Text>
        <TouchableOpacity
          onPress={this.handleTambah}
          style={{
            height: 35,
            width: 35,
            backgroundColor: Warna.hijau,
            borderRadius: 5,
            alignItems: 'center',
            justifyContent: 'center',
          }}>
          <Text style={{color: Warna.putih, fontSize: 20}}>+</Text>
        </TouchableOpacity>
      </View>
    );
  }
}
