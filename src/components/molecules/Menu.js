import React from 'react';
import {View, Text, TouchableOpacity, Image} from 'react-native';
import {Warna} from '../../../data';
import MenuItem from '../atoms/MenuItem';
import {withNavigation} from 'react-navigation';

const Menu = ({navigation, showAbout}) => {
  return (
    <View style={{marginBottom: 20}}>
      <View style={{flexDirection: 'row', marginTop: 20}}>
        <MenuItem
          onPress={showAbout}
          title="Tentang"
          subtitle="Kami"
          image={require('../../../img/menu/tentang_hutanku.png')}
        />
        <MenuItem
          onPress={() => navigation.navigate('Produk')}
          title="Produk"
          subtitle="Pasar"
          image={require('../../../img/menu/sosial_media_hutanku.png')}
        />
      </View>
      <View style={{flexDirection: 'row', marginTop: 20}}>
        <MenuItem
          onPress={() => navigation.navigate('Promo')}
          title="Promo"
          image={require('../../../img/menu/promo_hutanku.png')}
        />
        <MenuItem
          onPress={() => navigation.navigate('Sosmed')}
          title="Informasi"
          image={require('../../../img/menu/konsultasi_hutanku.png')}
        />
      </View>
    </View>
  );
};

export default withNavigation(Menu);
