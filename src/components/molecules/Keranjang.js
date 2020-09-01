import React from 'react';
import {View, Text, TouchableOpacity} from 'react-native';
import {Warna} from '../../../data';
import {faTimes} from '@fortawesome/free-solid-svg-icons';
import {FontAwesomeIcon} from '@fortawesome/react-native-fontawesome';

export default function Keranjang({close}) {
  return (
    <View>
      <View
        style={{
          height: 60,
          alignItems: 'center',
          backgroundColor: Warna.hijau,
          flexDirection: 'row',
          justifyContent: 'space-between',
          paddingHorizontal: 20,
        }}>
        <Text
          style={{
            fontSize: 18,
            color: Warna.hitam,
            fontFamily: 'Poppins-Medium',
          }}>
          Daftar Order
        </Text>
        <TouchableOpacity onPress={close}>
          <FontAwesomeIcon
            icon={faTimes}
            size={22}
            style={{color: Warna.hitam}}
          />
        </TouchableOpacity>
      </View>
      <View style={{flex: 1, padding: 20}}>
        <View
          style={{
            height: 60,
            justifyContent: 'center',
            backgroundColor: Warna.putih,
          }}>
          <Text
            style={{
              marginLeft: 20,
              fontSize: 16,
              color: Warna.biruTua,
              fontFamily: 'Poppins-Light',
            }}>
            DAFTAR ORDER ANDA
          </Text>
        </View>
        <View
          style={{
            height: 60,
            justifyContent: 'center',
            // backgroundColor: Warna.putih,
            borderLeftWidth: 1,
            borderBottomWidth: 1,
            borderRightWidth: 1,
            borderColor: Warna.putih,
          }}>
          <Text
            style={{
              marginLeft: 20,
              fontSize: 14,
              color: Warna.hitam,
            }}>
            Anda belum memesan apapun
          </Text>
        </View>
      </View>
    </View>
  );
}
