import React, {Component, Fragment} from 'react';
import {Text, View, TouchableOpacity, Image, Modal} from 'react-native';
import Counter from './Counter';
import {Warna} from '../../../data';
import NumberFormat from 'react-number-format';
import ImageView from 'react-native-image-viewing';
import FastImage from 'react-native-fast-image';
import ImageViewer from 'react-native-image-zoom-viewer';
import ImagePreview from './ImagePreview';

export default class ItemProduct extends Component {
  constructor() {
    super();
    this.state = {
      total: 0,
      harga: 1250,
      jumlah: 0,
    };
  }

  handleJumlah = (newValue, value) => {
    this.props.onhandleJumlah(
      newValue,
      value,
      this.props.nama,
      this.props.harga,
    );
  };

  handleChange = value => {
    const {harga, jumlah} = this.state;

    const jumlahAll = (harga, total) => {
      return harga * total;
    };

    this.setState({jumlah: jumlahAll(this.props.harga, value)}, () => {
      this.handleJumlah(this.state.jumlah, value);
    });
    // console.warn(jumlahAll(harga, value));
  };
  render() {
    const {jumlah} = this.state;
    return (
      <View
        onPress={() => console.log('ini item')}
        style={{
          flexDirection: 'row',
          padding: this.props.Hide ? 10 : 0,
          backgroundColor: this.props.Hide ? Warna.putih : null,
          marginHorizontal: this.props.Hide ? 20 : 0,
          marginTop: 10,
          marginBottom: 10,
          shadowColor: this.props.Hide ? '#000' : null,
          shadowOffset: this.props.Hide
            ? {
                width: 0,
                height: 1,
              }
            : null,
          shadowOpacity: this.props.Hide ? 0.22 : null,
          shadowRadius: this.props.Hide ? 2.22 : null,

          elevation: this.props.Hide ? 3 : null,
        }}>
        <View style={{flex: 1}}>
          <Text
            style={{
              fontSize: this.props.Hide ? 16 : 20,
              color: Warna.hitam,
              fontFamily: 'Poppins-Medium',
            }}>
            {this.props.nama}
          </Text>
          {/* {this.props.Hide ? (
            <Text
              style={{
                fontSize: this.props.Hide ? 12 : 14,
                color: Warna.hijauTua,
              }}>
              {this.props.stok}
            </Text>
          ) : null} */}

          <NumberFormat
            value={this.props.harga}
            displayType={'text'}
            thousandSeparator={true}
            prefix={'Rp. '}
            renderText={value => (
              <Text
                style={{
                  fontSize: 18,
                  color: Warna.hijau,
                }}>
                {value}
              </Text>
            )}
          />

          {/* counter start */}
          {this.props.Hide ? null : (
            <Counter onCounterChange={value => this.handleChange(value)} />
          )}

          {/* counter end */}
          {this.props.Hide ? (
            <TouchableOpacity
              onPress={this.props.onPressSpek}
              style={{
                paddingHorizontal: 15,
                paddingVertical: 5,
                alignSelf: 'flex-start',
                borderRadius: 5,
                marginTop: 10,
                borderColor: Warna.hijau,
                borderWidth: 1,
              }}>
              <Text
                style={{fontSize: 16, color: Warna.hijau, fontWeight: 'bold'}}>
                Lihat Detail
              </Text>
            </TouchableOpacity>
          ) : null}

          <Counter /* onCounterChange={value => this.handleChange(value)}  */ />
        </View>
        {this.props.Hide ? (
          <Fragment>
            <ImagePreview
              onClose={this.props.imageViewVisibleClose}
              visibleModal={this.props.imageViewVisible}
              ImageSource={this.props.imageView}
              title={this.props.titleImage}
            />

            <TouchableOpacity
              onPress={this.props.onPressImage}
              style={{
                height: 120,
                width: 120,

                alignSelf: 'flex-end',
              }}>
              <FastImage
                style={{
                  height: undefined,
                  width: undefined,
                  resizeMode: 'contain',
                  flex: 1,
                }}
                source={this.props.image}
                resizeMode={FastImage.resizeMode.contain}
              />
            </TouchableOpacity>
          </Fragment>
        ) : null}
      </View>
    );
  }
}
