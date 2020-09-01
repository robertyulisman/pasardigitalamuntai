import React from 'react';
import {View, Text} from 'react-native';
import {Warna} from '../../../data';

const Tags = ({title}) => {
  return (
    <View
      style={{
        width: 200,
        paddingVertical: 10,
        backgroundColor: Warna.putih,
        alignItems: 'center',
        justifyContent: 'center',
        alignSelf: 'center',
        borderRadius: 5,
        borderWidth: 1,
        borderColor: Warna.hijauTua,
      }}>
      <Text style={{color: Warna.hitam, fontFamily: 'Poppins-Medium'}}>
        {title}
      </Text>
    </View>
  );
};

export default Tags;
