import React, {Component} from 'react';
import {Text, View, Image, TouchableOpacity, Alert} from 'react-native';
import Tags from '../components/atoms/Tags';
import {Warna} from '../../data';
import {connect} from 'react-redux';
import CustomModal from '../components/molecules/CustomModal';
import PromoContent from '../components/molecules/PromoContent';

class Promo extends Component {
  render() {
    const {promo} = this.props.data;

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
            Pilih
          </Text>
          <Text
            style={{
              color: Warna.putih,
              fontSize: 22,
              fontFamily: 'Poppins-Medium',
            }}>
            Promo
          </Text>
        </View>
        <View style={{marginTop: 20}}>
          <View style={{marginTop: 20}}>
            {promo.map(item => {
              return (
                <TouchableOpacity
                  key={item.id}
                  onPress={() =>
                    this.props.navigation.navigate('InfoDetail', {
                      data: item,
                      type: 'promo',
                    })
                  }
                  style={{
                    flexDirection: 'row',
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
                    <Image
                      style={{
                        height: undefined,
                        width: undefined,
                        resizeMode: 'cover',
                        flex: 1,
                      }}
                      source={{
                        uri: `https://pasardigitalamuntai.com/assets/images/promo/${
                          item.gambar_promo
                        }`,
                      }}
                    />
                  </View>
                  <View
                    style={{
                      marginHorizontal: 10,
                      flex: 1,
                    }}>
                    <Text
                      style={{
                        fontSize: 18,
                        color: Warna.hitam,
                        marginLeft: 10,
                        fontFamily: 'Poppins-Medium',
                      }}>
                      {item.judul_promo}
                    </Text>
                  </View>
                </TouchableOpacity>
              );
            })}
          </View>
        </View>
      </View>
    );
  }
}

const mapStateToProps = state => ({
  data: state.data,
});

export default connect(mapStateToProps)(Promo);
