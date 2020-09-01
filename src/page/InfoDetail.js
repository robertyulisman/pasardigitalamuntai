import React, {Component} from 'react';
import {View, Text, Dimensions, Image, ScrollView} from 'react-native';
import {WebView} from 'react-native-webview';
const {width, height} = Dimensions.get('window');
import HTML from 'react-native-render-html';
import {Warna} from '../../data';
import Tags from '../components/atoms/Tags';

export default class InfoDetail extends Component {
  render() {
    const {data} = this.props.navigation.state.params;
    const {type} = this.props.navigation.state.params;
    return (
      <View style={{flex: 1}}>
        <View
          style={{
            width: '100%',
            height: 480,
            backgroundColor: Warna.putih,
            position: 'absolute',
            zIndex: -999,
            borderBottomLeftRadius: 5,
            borderBottomRightRadius: 5,
          }}>
          <Image
            style={{
              width: undefined,
              height: undefined,
              resizeMode: 'contain',
              flex: 1,
            }}
            source={require('../../img/top.png')}
          />
        </View>
        <View style={{marginHorizontal: 20, marginVertical: 30}}>
          <Text style={{color: Warna.putih, fontSize: 22, fontWeight: 'bold'}}>
            Detail
          </Text>
          <Text style={{color: Warna.putih, fontSize: 22, fontWeight: 'bold'}}>
            {type === 'promo' ? 'Promo' : 'Info'}
          </Text>
        </View>

        <ScrollView
          style={{backgroundColor: Warna.putih, marginHorizontal: 20}}>
          <View
            style={{
              height: 260,
              width: '100%',
              marginHorizontal: 10,

              alignSelf: 'center',
            }}
            v>
            <Image
              style={{
                height: undefined,
                width: undefined,
                resizeMode: 'contain',
                flex: 1,
              }}
              source={
                type === 'promo'
                  ? {
                      uri: `https://pasardigitalamuntai.com/assets/images/promo/${
                        data.gambar_promo
                      }`,
                    }
                  : {
                      uri: `https://pasardigitalamuntai.com/assets/images/info/${
                        data.gambar_info
                      }`,
                    }
              }
            />
          </View>
          <Text style={{marginTop: 10, marginHorizontal: 20, fontSize: 20}}>
            {type === 'promo' ? data.judul_promo : data.judul_info}
          </Text>
          <Text style={{marginTop: 10, marginHorizontal: 20, marginBottom: 10}}>
            {type === 'promo' ? data.tanggal_promo : data.tanggal_info}
          </Text>
          <WebView
            style={{
              height: height,
              width: width,
              paddingTop: 20,
              marginHorizontal: 20,
            }}
            startInLoadingState={true}
            javaScriptEnabledAndroid={true}
            source={
              type === 'promo'
                ? {html: data.konten_promo}
                : {html: data.konten_info}
            }
            scalesPageToFit={false}
          />
        </ScrollView>
      </View>
    );
  }
}
