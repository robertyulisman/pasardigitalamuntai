import React, {Component} from 'react';
import {Text, View, Image, TouchableOpacity, Linking} from 'react-native';
import Tags from '../components/atoms/Tags';
import {Warna} from '../../data';
import {connect} from 'react-redux';
import {ScrollView} from 'react-native-gesture-handler';
import FastImage from 'react-native-fast-image';

class Konsultasi extends Component {
  handleSosmedClick(item) {
    let no = item.no_wa;
    let code = '62';
    let wa = no.substring(1);
    let noWa = code.concat(wa);
    console.log('wa', noWa);
    const kata = item.kata_sapa;
    const kataReplace = kata.replace(' ', '%20');
    const _URL = `https://api.whatsapp.com/send?phone=${noWa}&text=${kataReplace}&source=&data=&app_absent=`;

    Linking.openURL(_URL);
  }
  render() {
    const {konsultasi} = this.props.data;

    return (
      <ScrollView style={{flex: 1}}>
        <View
          style={{
            width: '100%',
            height: 250,
            backgroundColor: Warna.hijau,
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
        <View
          style={{
            width: 300,
            height: 70,
            padding: 5,
            marginTop: 25,
            alignSelf: 'center',
          }}>
          <Image
            style={{
              width: undefined,
              height: undefined,
              resizeMode: 'contain',
              flex: 1,
            }}
            source={require('../../img/logo.png')}
          />
        </View>
        <View style={{marginTop: 20}}>
          <Tags title="Konsultasi" />
          <View style={{marginVertical: 20}}>
            {konsultasi.length !== 0 && konsultasi.data !== undefined ? (
              konsultasi.data.map(item => {
                return (
                  <TouchableOpacity
                    onPress={() => this.handleSosmedClick(item)}
                    key={item.key}
                    style={{
                      flexDirection: 'row',
                      backgroundColor: Warna.putih,
                      marginHorizontal: 20,
                      marginTop: 10,
                      shadowColor: '#000',
                      shadowOffset: {
                        width: 0,
                        height: 1,
                      },
                      shadowOpacity: 0.22,
                      shadowRadius: 2.22,

                      elevation: 3,
                      alignItems: 'center',
                    }}>
                    <View
                      style={{
                        height: 100,
                        width: 100,
                        marginLeft: 10,
                        padding: 10,
                      }}
                      v>
                      <FastImage
                        style={{
                          height: undefined,
                          width: undefined,
                          resizeMode: 'contain',
                          flex: 1,
                        }}
                        source={{
                          uri: `https://hutanku.id/assets/images/konsultasi/${
                            item.icon
                          }`,

                          priority: FastImage.priority.high,
                        }}
                        resizeMode={FastImage.resizeMode.contain}
                      />
                    </View>

                    <Text
                      style={{
                        fontSize: 18,
                        color: Warna.hitam,
                        marginHorizontal: 10,
                        flex: 1,
                      }}>
                      {item.nama}
                    </Text>
                  </TouchableOpacity>
                );
              })
            ) : (
              <Text
                style={{
                  textAlign: 'center',
                  justifyContent: 'center',
                  marginTop: 200,
                }}>
                Tidak Ada Koneksi Internet !
              </Text>
            )}
          </View>
        </View>
      </ScrollView>
    );
  }
}

const mapStateToProps = state => ({
  data: state.data,
});

export default connect(mapStateToProps)(Konsultasi);
