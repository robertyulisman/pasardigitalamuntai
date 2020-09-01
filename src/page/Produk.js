import React, {Component} from 'react';
import {Text, View, Image, TouchableOpacity, Alert} from 'react-native';
import Tags from '../components/atoms/Tags';
import {Warna} from '../../data';
import MenuProduct from '../components/atoms/MenuProduct';
import {FlatGrid} from 'react-native-super-grid';
import {connect} from 'react-redux';
import {ScrollView} from 'react-native-gesture-handler';

// import Axios from 'axios';

class Produk extends Component {
  render() {
    const {category} = this.props.data;
    // console.log('kategori', category);
    return (
      <ScrollView style={{flex: 1}}>
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
            Kategori
          </Text>
        </View>
        <View style={{marginTop: 20}}>
          {/* menu product */}
          {category.length !== 0 && category !== undefined ? (
            <View>
              <View style={{marginTop: 20, flexDirection: 'row'}}>
                <FlatGrid
                  itemDimension={150}
                  items={category}
                  style={{marginBottom: 10}}
                  renderItem={({item, index}) => (
                    <MenuProduct
                      onPress={() =>
                        this.props.navigation.navigate('DetailProduct', {
                          id: item.id,
                          nama: item.nama,
                        })
                      }
                      title={item.nama}
                      image={{
                        uri: `https://pasardigitalamuntai.com/assets/images/kategori_produk/${
                          item.icon
                        }`,
                      }}
                    />
                  )}
                />
              </View>
            </View>
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
      </ScrollView>
    );
  }
}

const mapStateToProps = state => ({
  data: state.data,
});

export default connect(mapStateToProps)(Produk);
