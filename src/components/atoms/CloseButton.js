import React from 'react';
import {TouchableOpacity, Text} from 'react-native';
import {Warna} from '../../../data';

const CloseButton = ({onPress}) => {
  return (
    <TouchableOpacity
      onPress={onPress}
      style={{
        paddingHorizontal: 20,
        paddingVertical: 10,
        borderRadius: 5,
        backgroundColor: Warna.merah,
        alignSelf: 'flex-end',
        marginTop: 20,
      }}>
      <Text style={{color: Warna.putih}}>Tutup</Text>
    </TouchableOpacity>
  );
};

export default CloseButton;
