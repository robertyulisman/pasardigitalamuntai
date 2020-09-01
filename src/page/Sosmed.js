import React, {Component, Profiler} from 'react';
import {
  Text,
  View,
  Image,
  TouchableOpacity,
  Linking,
  ScrollView,
} from 'react-native';
import Tags from '../components/atoms/Tags';
import {Warna} from '../../data';
import {connect} from 'react-redux';

class Sosmed extends Component {
  handleSosmedClick(item) {
    Linking.openURL(item.link);
  }
  render() {
    const {info} = this.props.data;
    // console.warn(sosmed.data);

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
          <Text
            style={{
              color: Warna.putih,
              fontSize: 22,
              fontFamily: 'Poppins-Medium',
            }}>
            Informasi
          </Text>
          <Text
            style={{
              color: Warna.putih,
              fontSize: 22,
              fontFamily: 'Poppins-Medium',
            }}>
            Kab. HSU
          </Text>
        </View>

        <ScrollView style={{marginTop: 20}}>
          {info.length !== 0 && info !== undefined ? (
            info.map(item => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  onPress={() =>
                    this.props.navigation.navigate('InfoDetail', {
                      data: item,
                      type: 'info',
                    })
                  }
                  key={item.id}
                  style={{
                    // flexDirection: 'row',
                    backgroundColor: Warna.putih,
                    marginHorizontal: 20,
                    marginTop: 20,
                    shadowColor: '#000',
                    shadowOffset: {
                      width: 0,
                      height: 1,
                    },
                    shadowOpacity: 0.22,
                    shadowRadius: 2.22,

                    elevation: 3,
                  }}>
                  <View
                    style={{
                      height: 180,
                      width: '100%',
                      padding: 15,
                    }}
                    v>
                    <Image
                      style={{
                        height: undefined,
                        width: undefined,
                        resizeMode: 'cover',
                        flex: 1,
                      }}
                      source={{
                        uri: `https://pasardigitalamuntai.com/assets/images/info/${
                          item.gambar_info
                        }`,
                      }}
                    />
                  </View>
                  <View style={{marginHorizontal: 20}}>
                    <Text
                      style={{
                        fontSize: 14,
                        color: Warna.hitam,
                        fontFamily: 'Poppins-Medium',
                      }}>
                      {item.judul_info}
                    </Text>
                    <Text
                      style={{
                        fontSize: 14,
                        color: Warna.hitam,
                        alignSelf: 'flex-end',
                        marginVertical: 10,
                      }}>
                      {item.tanggal_info}
                    </Text>
                  </View>
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
              Tidak Ada data !
            </Text>
          )}
        </ScrollView>
      </View>
    );
  }
}

const mapStateToProps = state => ({
  data: state.data,
});

export default connect(mapStateToProps)(Sosmed);
