import React from 'react';
import {View, Text, TouchableOpacity, Image} from 'react-native';
import {Warna} from '../../../data';
import FastImage from 'react-native-fast-image';

const MenuProduct = ({onPress, image, title}) => {
  return (
    <TouchableOpacity
      onPress={onPress}
      style={{
        backgroundColor: Warna.putih,
        marginHorizontal: 5,
        marginBottom: 5,
        flex: 1,

        shadowColor: '#000',
        shadowOffset: {
          width: 0,
          height: 1,
        },
        shadowOpacity: 0.22,
        shadowRadius: 2.22,

        elevation: 3,
        alignItems: 'center',
        padding: 20,
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
          source={image}
          resizeMode={FastImage.resizeMode.contain}
        />
      </View>

      <Text
        style={{
          textAlign: 'center',
          fontSize: 14,
          color: Warna.hitam,
          marginLeft: 10,
          fontFamily: 'Poppins-Medium',
        }}>
        {title}
      </Text>
    </TouchableOpacity>
  );
};

export default MenuProduct;
