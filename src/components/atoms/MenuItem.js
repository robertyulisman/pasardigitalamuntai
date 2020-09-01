import React from 'react';
import {View, Text, TouchableOpacity, Image} from 'react-native';
import {Warna} from '../../../data';

const MenuItem = ({onPress, title, subtitle, image}) => {
  return (
    <TouchableOpacity
      onPress={onPress}
      style={{
        flex: 1,
        height: 130,
        marginHorizontal: 10,
        backgroundColor: Warna.putih,
        borderRadius: 5,
        alignItems: 'flex-start',
        // justifyContent: 'center',
        paddingLeft: 10,
        paddingTop: 10,

        // borderWidth: 1,
        // borderColor: Warna.hijauTua,
        shadowColor: '#000',
        shadowOffset: {
          width: 0,
          height: 1,
        },
        shadowOpacity: 0.22,
        shadowRadius: 2.22,

        elevation: 3,
      }}>
      <Image
        style={{
          height: undefined,
          width: undefined,
          resizeMode: 'contain',
          position: 'absolute',
          left: 0,
          top: 0,
          right: 0,
          bottom: 0,
          flex: 1,
        }}
        source={image}
      />
      <Text
        style={{
          color: Warna.hitam,

          marginRight: 20,
          fontSize: 16,
          fontFamily: 'Poppins-Medium',
        }}>
        {title}
      </Text>
      <Text
        style={{
          color: Warna.hitam,
          marginRight: 20,
          marginTop: -10,
          fontSize: 16,
          fontFamily: 'Poppins-Medium',
        }}>
        {subtitle}
      </Text>
    </TouchableOpacity>
  );
};

export default MenuItem;
