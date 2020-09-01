import React, {Component} from 'react';
import {Text, View, ScrollView, Image} from 'react-native';
import {Warna} from '../../data';
import {TouchableOpacity} from 'react-native-gesture-handler';
import CloseButton from '../components/atoms/CloseButton';
import {connect} from 'react-redux';
import HTML from 'react-native-render-html';
import FastImage from 'react-native-fast-image';
import {faTimes} from '@fortawesome/free-solid-svg-icons';
import {FontAwesomeIcon} from '@fortawesome/react-native-fontawesome';

class Pembayaran extends Component {
  render() {
    const {pembayaran} = this.props.data;
    console.log('aaaaa', pembayaran);

    return (
      <View
        style={{
          flex: 1,
          backgroundColor: Warna.putih,
          borderRadius: 10,
        }}>
        <View
          style={{
            flexDirection: 'row',
            justifyContent: 'space-between',
            backgroundColor: Warna.hijau,
            padding: 20,

            borderTopRightRadius: 10,
            borderTopLeftRadius: 10,
          }}>
          <Text style={{fontSize: 18, color: Warna.putih}}>
            Cara Pembayaran
          </Text>
          <TouchableOpacity onPress={this.props.onCancell}>
            <FontAwesomeIcon
              icon={faTimes}
              size={22}
              style={{color: Warna.putih}}
            />
          </TouchableOpacity>
        </View>
        {pembayaran.length !== 0 && pembayaran !== undefined ? (
          <ScrollView
            style={{
              flex: 1,
            }}>
            <View
              style={{
                backgroundColor: Warna.putih,
                padding: 20,
                borderBottomLeftRadius: 10,
                borderBottomRightRadius: 10,
                // paddingBottom: 50,
              }}>
              <View style={{height: 250}}>
                <FastImage
                  style={{
                    height: undefined,
                    width: undefined,
                    resizeMode: 'cover',
                    flex: 1,
                  }}
                  source={{
                    uri: `https://pasardigitalamuntai.com/assets/images/cara_pembayaran/${
                      pembayaran[0].foto_cara_pembayaran
                    }`,

                    priority: FastImage.priority.normal,
                  }}
                  resizeMode={FastImage.resizeMode.cover}
                />
              </View>

              <HTML html={pembayaran[0].isi_cara_pembayaran} />

              <CloseButton onPress={this.props.onCancell} />
            </View>
          </ScrollView>
        ) : (
          <Text
            style={{
              textAlign: 'center',
              justifyContent: 'center',
              marginTop: 100,
            }}>
            Tidak Ada ada !
          </Text>
        )}
      </View>
    );
  }
}

const mapStateToProps = state => ({
  data: state.data,
});

export default connect(mapStateToProps)(Pembayaran);
